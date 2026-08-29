#!/usr/bin/env python3

"""Render a review package as a dependency-free static HTML site."""

from __future__ import annotations

import argparse
import contextlib
import html
import os
import posixpath
import re
import secrets
import stat
import sys
import unicodedata
from dataclasses import dataclass
from pathlib import Path
from urllib.parse import quote, unquote, urlsplit, urlunsplit


PREFERRED_ORDER = (
    "HANDOFF.md",
    "prior-art-summary.md",
    "source-scope-summary.md",
    "report.md",
    "attribution.md",
    "publication-checklist.md",
    "scope.md",
    "aspect-map.md",
    "chronology.md",
    "evidence-ledger.md",
    "search-log.md",
    "inaccessible-resources.md",
)
RESERVED_OUTPUT_NAMES = frozenset({"index.html", "site.css"})

HEADING_RE = re.compile(r"^(#{1,6})[ \t]+(.+?)[ \t]*#*[ \t]*$")
FENCE_RE = re.compile(r"^[ \t]*(`{3,}|~{3,})(.*)$")
LIST_RE = re.compile(r"^( *)([-+*]|\d+[.)])[ \t]+(.*)$")
TASK_RE = re.compile(r"^\[([ xX])\][ \t]+(.*)$")
TABLE_SEPARATOR_RE = re.compile(r"^:?-{3,}:?$")
HTTPS_RE = re.compile(r"https://[^\s<>()]+")
CONTROL_RE = re.compile(r"[\x00-\x1f\x7f]")


SITE_CSS = """\
:root {
  color-scheme: light dark;
  --background: #f7f8fa;
  --surface: #ffffff;
  --text: #1f2328;
  --muted: #59636e;
  --border: #d0d7de;
  --accent: #0969da;
  --code: #eff1f3;
  --focus: #bf8700;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
  line-height: 1.55;
}

* {
  box-sizing: border-box;
}

html {
  background: var(--background);
  color: var(--text);
}

body {
  margin: 0;
}

a {
  color: var(--accent);
  overflow-wrap: anywhere;
}

a:focus-visible,
summary:focus-visible {
  outline: 3px solid var(--focus);
  outline-offset: 3px;
}

.skip-link {
  background: var(--surface);
  left: 1rem;
  padding: 0.6rem 0.8rem;
  position: absolute;
  top: -5rem;
  z-index: 10;
}

.skip-link:focus {
  top: 1rem;
}

.site-header,
.package-nav,
.page-controls,
main,
.site-footer {
  margin-inline: auto;
  max-width: 76rem;
  padding-inline: clamp(1rem, 4vw, 3rem);
}

.site-header {
  padding-block: 1.5rem 0.75rem;
}

.site-header p,
.site-footer {
  color: var(--muted);
}

.package-nav {
  border-block: 1px solid var(--border);
  padding-block: 0.75rem;
}

.package-nav ul,
.page-controls ul {
  display: flex;
  flex-wrap: wrap;
  gap: 0.45rem 1rem;
  list-style: none;
  margin: 0;
  padding: 0;
}

.package-nav [aria-current="page"] {
  color: var(--text);
  font-weight: 700;
  text-decoration-thickness: 0.18em;
}

main {
  display: grid;
  gap: 2rem;
  grid-template-columns: minmax(12rem, 18rem) minmax(0, 1fr);
  padding-block: 2rem;
}

.index-main {
  display: block;
}

.toc {
  align-self: start;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 0.45rem;
  padding: 1rem;
  position: sticky;
  top: 1rem;
}

.toc h2 {
  font-size: 1rem;
  margin-top: 0;
}

.toc ol {
  padding-left: 1.25rem;
}

.toc .toc-level-3,
.toc .toc-level-4,
.toc .toc-level-5,
.toc .toc-level-6 {
  margin-left: 1rem;
}

article {
  min-width: 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  line-height: 1.25;
  scroll-margin-top: 1rem;
}

h2 {
  border-bottom: 1px solid var(--border);
  padding-bottom: 0.25rem;
}

code {
  background: var(--code);
  border-radius: 0.25rem;
  font-family: ui-monospace, SFMono-Regular, Consolas, monospace;
  font-size: 0.92em;
  padding: 0.1em 0.3em;
}

pre {
  background: var(--code);
  border: 1px solid var(--border);
  border-radius: 0.45rem;
  overflow: auto;
  padding: 1rem;
}

pre code {
  background: transparent;
  padding: 0;
}

blockquote {
  border-left: 0.3rem solid var(--border);
  color: var(--muted);
  margin-left: 0;
  padding-left: 1rem;
}

.task-list {
  list-style: none;
  padding-left: 0;
}

.task-list input {
  margin-right: 0.5rem;
}

.table-wrap {
  margin-block: 1rem;
  overflow-x: auto;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th,
td {
  border: 1px solid var(--border);
  padding: 0.45rem 0.6rem;
  text-align: left;
  vertical-align: top;
}

th {
  background: var(--code);
}

.visually-hidden {
  clip: rect(0 0 0 0);
  clip-path: inset(50%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

.review-pages {
  display: grid;
  gap: 1rem;
  grid-template-columns: repeat(auto-fit, minmax(16rem, 1fr));
  list-style: none;
  padding: 0;
}

.review-pages li {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 0.45rem;
  padding: 1rem;
}

.page-controls {
  border-top: 1px solid var(--border);
  padding-block: 1rem;
}

.page-controls ul {
  justify-content: space-between;
}

.site-footer {
  padding-block: 1rem 2rem;
}

@media (max-width: 52rem) {
  main {
    display: block;
  }

  .toc {
    margin-bottom: 2rem;
    position: static;
  }
}

@media (prefers-color-scheme: dark) {
  :root {
    --background: #0d1117;
    --surface: #161b22;
    --text: #e6edf3;
    --muted: #9da7b3;
    --border: #30363d;
    --accent: #58a6ff;
    --code: #21262d;
    --focus: #d29922;
  }
}

@media print {
  :root {
    color-scheme: light;
    --background: #ffffff;
    --surface: #ffffff;
    --text: #000000;
    --muted: #333333;
    --border: #777777;
    --code: #f2f2f2;
  }

  .skip-link,
  .package-nav,
  .page-controls,
  .toc,
  .site-footer {
    display: none;
  }

  main {
    display: block;
    max-width: none;
    padding: 0;
  }

  a {
    color: inherit;
    text-decoration: underline;
  }

  pre,
  table,
  blockquote {
    break-inside: avoid;
  }
}
"""


@dataclass(frozen=True)
class ReviewPage:
    source_name: str
    output_name: str
    title: str
    body: str
    headings: tuple[tuple[int, str, str], ...]


class Slugger:
    def __init__(self) -> None:
        self._counts: dict[str, int] = {}

    def make(self, text: str) -> str:
        normalized = unicodedata.normalize("NFKD", text)
        ascii_text = normalized.encode("ascii", "ignore").decode("ascii")
        base = re.sub(r"[^a-z0-9]+", "-", ascii_text.lower()).strip("-")
        if not base:
            base = "section"
        count = self._counts.get(base, 0) + 1
        self._counts[base] = count
        return base if count == 1 else f"{base}-{count}"


def display_name(filename: str) -> str:
    stem = filename[:-3]
    if filename == "HANDOFF.md":
        return "Handoff"
    return stem.replace("-", " ").title()


def page_href(filename: str) -> str:
    return f"./{quote(filename, safe='-._~')}"


def source_href(filename: str) -> str:
    return f"../{quote(filename, safe='-._~')}"


def discover_markdown_names(review_fd: int) -> list[str]:
    preferred = {name: index for index, name in enumerate(PREFERRED_ORDER)}
    names: list[str] = []
    for name in os.listdir(review_fd):
        if Path(name).suffix != ".md":
            continue
        entry_status = os.stat(name, dir_fd=review_fd, follow_symlinks=False)
        if stat.S_ISREG(entry_status.st_mode):
            names.append(name)
    return sorted(
        names,
        key=lambda name: (
            0 if name in preferred else 1,
            preferred.get(name, 0),
            name.encode("utf-8"),
        ),
    )


def discover_markdown(review_dir: Path) -> list[Path]:
    review_fd = open_directory_path(review_dir)
    try:
        return [review_dir / name for name in discover_markdown_names(review_fd)]
    finally:
        os.close(review_fd)


def read_markdown_source(review_fd: int, name: str) -> str:
    flags = (
        os.O_RDONLY
        | getattr(os, "O_NONBLOCK", 0)
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    file_fd = os.open(name, flags, dir_fd=review_fd)
    if not stat.S_ISREG(os.fstat(file_fd).st_mode):
        os.close(file_fd)
        raise OSError(f"Markdown source is not a regular file: {name}")
    with os.fdopen(file_fd, "r", encoding="utf-8", newline=None) as stream:
        return stream.read()


def lexical_absolute(path: Path) -> Path:
    return Path(os.path.abspath(os.fspath(path)))


def first_symlink_component(path: Path) -> Path | None:
    absolute = lexical_absolute(path)
    current = Path(absolute.anchor)
    for component in absolute.parts[1:]:
        current /= component
        if current.is_symlink():
            return current
    return None


def validated_output_dir(
    review_dir: Path, requested_output: Path | None
) -> Path:
    output_dir = lexical_absolute(
        requested_output if requested_output is not None else review_dir / "html"
    )
    symlink = first_symlink_component(output_dir)
    if symlink is not None:
        raise ValueError(f"output path contains a symbolic link: {symlink}")
    if output_dir.exists() and not output_dir.is_dir():
        raise ValueError(f"output path is not a directory: {output_dir}")
    if output_dir.parent != review_dir:
        raise ValueError("output directory must be an immediate child of the review")
    if output_dir == review_dir or review_dir.is_relative_to(output_dir):
        raise ValueError("output directory must not contain the review directory")
    return output_dir


def strip_inline_markup(text: str) -> str:
    text = re.sub(r"`([^`]*)`", r"\1", text)
    text = re.sub(r"!\[([^\]]*)\]\([^)]*\)", r"\1", text)
    text = re.sub(r"\[([^\]]+)\]\([^)]*\)", r"\1", text)
    return re.sub(r"[*_~]", "", text).strip()


class MarkdownRenderer:
    def __init__(self, review_dir: Path, source_name: str, markdown_names: set[str]):
        self.review_dir = review_dir
        self.source_name = source_name
        self.markdown_names = markdown_names
        self.slugger = Slugger()
        self.headings: list[tuple[int, str, str]] = []

    def safe_href(self, destination: str) -> str | None:
        destination = destination.strip()
        if destination.startswith("<") and destination.endswith(">"):
            destination = destination[1:-1]
        if not destination or CONTROL_RE.search(destination):
            return None

        decoded = unquote(destination)
        if CONTROL_RE.search(decoded) or "\\" in destination or "\\" in decoded:
            return None
        if destination.startswith("//") or decoded.startswith("//"):
            return None

        parsed = urlsplit(destination)
        scheme = parsed.scheme.lower()
        if scheme:
            if scheme not in {"http", "https", "mailto"}:
                return None
            return urlunsplit(parsed)

        if parsed.netloc or parsed.path.startswith("/") or decoded.startswith("/"):
            return None
        if not parsed.path:
            return destination if parsed.fragment else None
        if parsed.query:
            return None

        decoded_path = unquote(parsed.path)
        segments = decoded_path.split("/")
        if any(segment in {"", ".", ".."} for segment in segments):
            return None
        normalized = posixpath.normpath(
            posixpath.join(posixpath.dirname(self.source_name), decoded_path)
        )
        if normalized.startswith("../") or "/" in normalized:
            return None
        if normalized not in self.markdown_names:
            return None
        return page_href(f"{normalized[:-3]}.html") + (
            f"#{quote(parsed.fragment, safe='-._~')}" if parsed.fragment else ""
        )

    def render_inline(self, text: str, allow_links: bool = True) -> str:
        output: list[str] = []
        index = 0
        while index < len(text):
            if text[index] == "\\" and index + 1 < len(text):
                output.append(html.escape(text[index + 1]))
                index += 2
                continue

            if text[index] == "`":
                run = len(text[index:]) - len(text[index:].lstrip("`"))
                delimiter = "`" * run
                end = text.find(delimiter, index + run)
                if end != -1:
                    code = text[index + run : end].strip()
                    output.append(f"<code>{html.escape(code)}</code>")
                    index = end + run
                    continue

            if allow_links and text[index] == "[":
                label_end = text.find("](", index + 1)
                if label_end != -1:
                    destination_end = self._find_link_end(text, label_end + 2)
                    if destination_end != -1:
                        label = text[index + 1 : label_end]
                        raw_destination = text[label_end + 2 : destination_end]
                        destination = self._link_destination(raw_destination)
                        rendered_label = self.render_inline(label, allow_links=False)
                        href = self.safe_href(destination)
                        if href is None:
                            output.append(rendered_label)
                        else:
                            output.append(
                                f'<a href="{html.escape(href, quote=True)}">'
                                f"{rendered_label}</a>"
                            )
                        index = destination_end + 1
                        continue

            if text.startswith("**", index) or text.startswith("__", index):
                delimiter = text[index : index + 2]
                end = text.find(delimiter, index + 2)
                if end != -1:
                    content = self.render_inline(text[index + 2 : end], allow_links)
                    output.append(f"<strong>{content}</strong>")
                    index = end + 2
                    continue

            if text[index] in {"*", "_"}:
                delimiter = text[index]
                end = text.find(delimiter, index + 1)
                if end != -1:
                    content = self.render_inline(text[index + 1 : end], allow_links)
                    output.append(f"<em>{content}</em>")
                    index = end + 1
                    continue

            if allow_links and text.startswith("https://", index):
                match = HTTPS_RE.match(text, index)
                if match:
                    candidate = match.group(0)
                    trailing = ""
                    while candidate and candidate[-1] in ".,;:!?]}":
                        trailing = candidate[-1] + trailing
                        candidate = candidate[:-1]
                    href = self.safe_href(candidate)
                    if href:
                        escaped = html.escape(href, quote=True)
                        output.append(f'<a href="{escaped}">{html.escape(candidate)}</a>')
                        output.append(html.escape(trailing))
                        index = match.end()
                        continue

            output.append(html.escape(text[index]))
            index += 1
        return "".join(output)

    @staticmethod
    def _find_link_end(text: str, start: int) -> int:
        depth = 0
        for index in range(start, len(text)):
            if text[index] == "\\":
                continue
            if text[index] == "(":
                depth += 1
            elif text[index] == ")":
                if depth == 0:
                    return index
                depth -= 1
        return -1

    @staticmethod
    def _link_destination(raw: str) -> str:
        raw = raw.strip()
        if raw.startswith("<"):
            closing = raw.find(">")
            return raw[: closing + 1] if closing != -1 else raw
        return raw.split(None, 1)[0] if raw else ""

    @staticmethod
    def _indent_width(value: str) -> int:
        return len(value.expandtabs(4))

    @staticmethod
    def _split_table_row(line: str) -> list[str]:
        stripped = line.strip()
        if stripped.startswith("|"):
            stripped = stripped[1:]
        if stripped.endswith("|") and not stripped.endswith("\\|"):
            stripped = stripped[:-1]

        cells: list[str] = []
        current: list[str] = []
        escaped = False
        in_code = False
        for character in stripped:
            if escaped:
                current.append(character)
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == "`":
                in_code = not in_code
                current.append(character)
            elif character == "|" and not in_code:
                cells.append("".join(current).strip())
                current = []
            else:
                current.append(character)
        if escaped:
            current.append("\\")
        cells.append("".join(current).strip())
        return cells

    def _is_table(self, lines: list[str], index: int) -> bool:
        if index + 1 >= len(lines) or "|" not in lines[index]:
            return False
        separators = self._split_table_row(lines[index + 1])
        headers = self._split_table_row(lines[index])
        return (
            len(headers) == len(separators)
            and len(headers) > 0
            and all(TABLE_SEPARATOR_RE.fullmatch(cell) for cell in separators)
        )

    @staticmethod
    def _is_horizontal_rule(line: str) -> bool:
        compact = line.strip().replace(" ", "")
        return (
            len(compact) >= 3
            and compact[0] in {"-", "*", "_"}
            and set(compact) == {compact[0]}
        )

    def _starts_block(self, lines: list[str], index: int) -> bool:
        line = lines[index]
        return bool(
            not line.strip()
            or HEADING_RE.match(line)
            or FENCE_RE.match(line)
            or LIST_RE.match(line)
            or line.lstrip().startswith(">")
            or self._is_horizontal_rule(line)
            or self._is_table(lines, index)
        )

    def _render_list(
        self, lines: list[str], index: int, indent: int, ordered: bool
    ) -> tuple[str, int]:
        tag = "ol" if ordered else "ul"
        items: list[str] = []
        task_list = False

        while index < len(lines):
            match = LIST_RE.match(lines[index])
            if not match:
                break
            current_indent = self._indent_width(match.group(1))
            current_ordered = match.group(2)[0].isdigit()
            if current_indent != indent or current_ordered != ordered:
                break

            content = match.group(3)
            index += 1
            continuation: list[str] = []
            nested: list[str] = []

            while index < len(lines):
                if not lines[index].strip():
                    next_index = index + 1
                    while next_index < len(lines) and not lines[next_index].strip():
                        next_index += 1
                    if next_index >= len(lines):
                        index = next_index
                        break
                    next_match = LIST_RE.match(lines[next_index])
                    if next_match and self._indent_width(next_match.group(1)) >= indent:
                        index = next_index
                        continue
                    break

                next_match = LIST_RE.match(lines[index])
                if next_match:
                    next_indent = self._indent_width(next_match.group(1))
                    if next_indent > indent:
                        nested_html, index = self._render_list(
                            lines,
                            index,
                            next_indent,
                            next_match.group(2)[0].isdigit(),
                        )
                        nested.append(nested_html)
                        continue
                    break

                leading = len(lines[index]) - len(lines[index].lstrip(" "))
                if leading > indent:
                    continuation.append(lines[index].strip())
                    index += 1
                    continue
                break

            task = TASK_RE.match(content)
            if task:
                task_list = True
                checked = task.group(1).lower() == "x"
                checkbox = (
                    '<input type="checkbox" disabled'
                    + (" checked" if checked else "")
                    + ' aria-label="Task status">'
                )
                item_body = checkbox + self.render_inline(task.group(2))
            else:
                item_body = self.render_inline(content)

            if continuation:
                item_body += " " + self.render_inline(" ".join(continuation))
            items.append(f"<li>{item_body}{''.join(nested)}</li>")

        class_attribute = ' class="task-list"' if task_list and not ordered else ""
        return f"<{tag}{class_attribute}>{''.join(items)}</{tag}>", index

    def render(self, markdown: str) -> tuple[str, tuple[tuple[int, str, str], ...]]:
        lines = markdown.replace("\r\n", "\n").replace("\r", "\n").split("\n")
        rendered: list[str] = []
        index = 0

        while index < len(lines):
            line = lines[index]
            if not line.strip():
                index += 1
                continue

            fence = FENCE_RE.match(line)
            if fence:
                delimiter = fence.group(1)
                code_lines: list[str] = []
                index += 1
                while index < len(lines):
                    closing = FENCE_RE.match(lines[index])
                    if closing and closing.group(1)[0] == delimiter[0] and len(
                        closing.group(1)
                    ) >= len(delimiter):
                        index += 1
                        break
                    code_lines.append(lines[index])
                    index += 1
                rendered.append(
                    "<pre><code>"
                    + html.escape("\n".join(code_lines))
                    + "</code></pre>"
                )
                continue

            heading = HEADING_RE.match(line)
            if heading:
                level = len(heading.group(1))
                source_text = heading.group(2).strip()
                title = strip_inline_markup(source_text)
                identifier = self.slugger.make(title)
                self.headings.append((level, title, identifier))
                rendered.append(
                    f'<h{level} id="{identifier}">'
                    f"{self.render_inline(source_text)}</h{level}>"
                )
                index += 1
                continue

            if self._is_horizontal_rule(line):
                rendered.append("<hr>")
                index += 1
                continue

            if self._is_table(lines, index):
                headers = self._split_table_row(lines[index])
                index += 2
                rows: list[list[str]] = []
                while index < len(lines) and "|" in lines[index] and lines[index].strip():
                    row = self._split_table_row(lines[index])
                    if len(row) != len(headers):
                        break
                    rows.append(row)
                    index += 1
                header_html = "".join(
                    f'<th scope="col">{self.render_inline(cell)}</th>'
                    for cell in headers
                )
                body_html = "".join(
                    "<tr>"
                    + "".join(f"<td>{self.render_inline(cell)}</td>" for cell in row)
                    + "</tr>"
                    for row in rows
                )
                rendered.append(
                    '<div class="table-wrap"><table>'
                    '<caption class="visually-hidden">Data table</caption>'
                    f"<thead><tr>{header_html}</tr></thead>"
                    f"<tbody>{body_html}</tbody></table></div>"
                )
                continue

            list_match = LIST_RE.match(line)
            if list_match:
                list_html, index = self._render_list(
                    lines,
                    index,
                    self._indent_width(list_match.group(1)),
                    list_match.group(2)[0].isdigit(),
                )
                rendered.append(list_html)
                continue

            if line.lstrip().startswith(">"):
                quote_lines: list[str] = []
                while index < len(lines) and lines[index].lstrip().startswith(">"):
                    quote = lines[index].lstrip()[1:]
                    quote_lines.append(quote[1:] if quote.startswith(" ") else quote)
                    index += 1
                quote_html, _ = self.render("\n".join(quote_lines))
                rendered.append(f"<blockquote>{quote_html}</blockquote>")
                continue

            paragraph_lines = [line.strip()]
            index += 1
            while index < len(lines) and not self._starts_block(lines, index):
                paragraph_lines.append(lines[index].strip())
                index += 1
            rendered.append(
                f"<p>{self.render_inline(' '.join(paragraph_lines))}</p>"
            )

        return "\n".join(rendered), tuple(self.headings)


def document_title(markdown: str, filename: str) -> str:
    for line in markdown.replace("\r\n", "\n").replace("\r", "\n").split("\n"):
        heading = HEADING_RE.match(line)
        if heading:
            return strip_inline_markup(heading.group(2))
    return display_name(filename)


def package_navigation(pages: list[ReviewPage], current: str | None) -> str:
    links = ['<li><a href="./index.html">Index</a></li>']
    if current is None:
        links[0] = '<li><a href="./index.html" aria-current="page">Index</a></li>'
    for page in pages:
        current_attribute = (
            ' aria-current="page"' if page.output_name == current else ""
        )
        links.append(
            f'<li><a href="{html.escape(page_href(page.output_name), quote=True)}"'
            f"{current_attribute}>{html.escape(display_name(page.source_name))}</a></li>"
        )
    return (
        '<nav class="package-nav" aria-label="Review package">'
        f"<ul>{''.join(links)}</ul></nav>"
    )


def page_controls(pages: list[ReviewPage], position: int) -> str:
    previous_link = (
        f'<a rel="prev" href="{html.escape(page_href(pages[position - 1].output_name), quote=True)}">'
        f"Previous: {html.escape(display_name(pages[position - 1].source_name))}</a>"
        if position > 0
        else '<span aria-disabled="true">Previous</span>'
    )
    next_link = (
        f'<a rel="next" href="{html.escape(page_href(pages[position + 1].output_name), quote=True)}">'
        f"Next: {html.escape(display_name(pages[position + 1].source_name))}</a>"
        if position + 1 < len(pages)
        else '<span aria-disabled="true">Next</span>'
    )
    return (
        '<nav class="page-controls" aria-label="Page sequence"><ul>'
        f"<li>{previous_link}</li>"
        '<li><a href="./index.html">Index</a></li>'
        f"<li>{next_link}</li>"
        "</ul></nav>"
    )


def table_of_contents(headings: tuple[tuple[int, str, str], ...]) -> str:
    entries = [
        f'<li class="toc-level-{level}"><a href="#{identifier}">'
        f"{html.escape(title)}</a></li>"
        for level, title, identifier in headings
    ]
    if not entries:
        return ""
    return (
        '<nav class="toc" aria-labelledby="toc-title">'
        '<h2 id="toc-title">On this page</h2>'
        f"<ol>{''.join(entries)}</ol></nav>"
    )


def html_document(title: str, package_name: str, navigation: str, main: str) -> str:
    return f"""\
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{html.escape(title)} | {html.escape(package_name)}</title>
  <link rel="stylesheet" href="site.css">
</head>
<body>
  <a class="skip-link" href="#main-content">Skip to main content</a>
  <header class="site-header">
    <strong>{html.escape(package_name)}</strong>
    <p>This HTML is a supplementary local view. The Markdown review package remains normative.</p>
  </header>
  {navigation}
  {main}
</body>
</html>
"""


def render_index(package_name: str, pages: list[ReviewPage]) -> str:
    items = "".join(
        "<li>"
        f'<a href="{html.escape(page_href(page.output_name), quote=True)}">'
        f"<strong>{html.escape(display_name(page.source_name))}</strong></a>"
        f"<br><small>{html.escape(page.source_name)}</small>"
        "</li>"
        for page in pages
    )
    main = f"""\
  <main id="main-content" class="index-main" tabindex="-1">
    <h1>Review package</h1>
    <p>Select a rendered review document. Source Markdown remains the normative record.</p>
    <ol class="review-pages">{items}</ol>
  </main>
  <footer class="site-footer"><p>Dependency-free static rendering for local browser use.</p></footer>"""
    return html_document(
        "Review package", package_name, package_navigation(pages, None), main
    )


def render_page(package_name: str, pages: list[ReviewPage], position: int) -> str:
    page = pages[position]
    main = f"""\
  <main id="main-content" tabindex="-1">
    {table_of_contents(page.headings)}
    <article aria-label="{html.escape(page.title, quote=True)}">
{page.body}
    </article>
  </main>
  {page_controls(pages, position)}
  <footer class="site-footer">
    <p><a href="{html.escape(source_href(page.source_name), quote=True)}">Open normative source Markdown</a></p>
  </footer>"""
    return html_document(
        page.title,
        package_name,
        package_navigation(pages, page.output_name),
        main,
    )


def expected_site_from_fd(
    review_fd: int, review_dir: Path
) -> dict[str, str]:
    source_names = discover_markdown_names(review_fd)
    markdown_names = set(source_names)
    pages: list[ReviewPage] = []
    output_names = set(RESERVED_OUTPUT_NAMES)
    for source_name in source_names:
        output_name = f"{Path(source_name).stem}.html"
        if output_name in output_names:
            raise ValueError(
                f"Markdown output name is reserved or duplicated: "
                f"{source_name} -> {output_name}"
            )
        output_names.add(output_name)
        markdown = read_markdown_source(review_fd, source_name)
        renderer = MarkdownRenderer(review_dir, source_name, markdown_names)
        body, headings = renderer.render(markdown)
        pages.append(
            ReviewPage(
                source_name=source_name,
                output_name=output_name,
                title=document_title(markdown, source_name),
                body=body,
                headings=headings,
            )
        )

    package_name = review_dir.name
    output = {"site.css": SITE_CSS, "index.html": render_index(package_name, pages)}
    for position, page in enumerate(pages):
        output[page.output_name] = render_page(package_name, pages, position)
    return output


def expected_site(review_dir: Path) -> dict[str, str]:
    review_dir = lexical_absolute(review_dir)
    review_fd = open_directory_path(review_dir)
    try:
        return expected_site_from_fd(review_fd, review_dir)
    finally:
        os.close(review_fd)


def directory_open_flags() -> int:
    return (
        os.O_RDONLY
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_DIRECTORY", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )


def open_directory_path(path: Path) -> int:
    absolute = lexical_absolute(path)
    current_fd = os.open(absolute.anchor, directory_open_flags())
    try:
        for component in absolute.parts[1:]:
            next_fd = os.open(component, directory_open_flags(), dir_fd=current_fd)
            os.close(current_fd)
            current_fd = next_fd
        return current_fd
    except BaseException:
        os.close(current_fd)
        raise


@contextlib.contextmanager
def opened_output_dir(review_fd: int, output_name: str, create: bool):
    output_fd: int | None = None
    try:
        if create:
            try:
                os.mkdir(output_name, mode=0o755, dir_fd=review_fd)
            except FileExistsError:
                pass
        output_fd = os.open(output_name, directory_open_flags(), dir_fd=review_fd)
        yield output_fd
    finally:
        if output_fd is not None:
            os.close(output_fd)


def verify_directory_binding(parent_fd: int, name: str, opened_fd: int) -> None:
    path_status = os.stat(name, dir_fd=parent_fd, follow_symlinks=False)
    open_status = os.fstat(opened_fd)
    if (
        not stat.S_ISDIR(path_status.st_mode)
        or path_status.st_dev != open_status.st_dev
        or path_status.st_ino != open_status.st_ino
    ):
        raise OSError(f"directory changed during rendering: {name}")


def verify_path_binding(path: Path, opened_fd: int) -> None:
    current_fd = open_directory_path(path)
    try:
        current_status = os.fstat(current_fd)
        open_status = os.fstat(opened_fd)
        if (
            current_status.st_dev != open_status.st_dev
            or current_status.st_ino != open_status.st_ino
        ):
            raise OSError(f"review directory changed during rendering: {path}")
    finally:
        os.close(current_fd)


def verify_output_binding(review_fd: int, output_name: str, output_fd: int) -> None:
    path_status = os.stat(output_name, dir_fd=review_fd, follow_symlinks=False)
    open_status = os.fstat(output_fd)
    if (
        not stat.S_ISDIR(path_status.st_mode)
        or path_status.st_dev != open_status.st_dev
        or path_status.st_ino != open_status.st_ino
    ):
        raise OSError("output directory changed during rendering")


def create_staging_dir(output_fd: int) -> tuple[str, int]:
    for _ in range(100):
        name = f".render-review-stage.{secrets.token_hex(16)}"
        try:
            os.mkdir(name, mode=0o700, dir_fd=output_fd)
        except FileExistsError:
            continue
        return name, os.open(name, directory_open_flags(), dir_fd=output_fd)
    raise OSError("cannot allocate a private staging directory")


def remove_staging_dir(output_fd: int, staging_name: str, staging_fd: int) -> None:
    for name in os.listdir(staging_fd):
        os.unlink(name, dir_fd=staging_fd)
    os.close(staging_fd)
    os.rmdir(staging_name, dir_fd=output_fd)


def write_staged_file(staging_fd: int, name: str, content: str) -> os.stat_result:
    flags = (
        os.O_WRONLY
        | os.O_CREAT
        | os.O_EXCL
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    file_fd = os.open(name, flags, 0o644, dir_fd=staging_fd)
    try:
        data = content.encode("utf-8")
        offset = 0
        while offset < len(data):
            offset += os.write(file_fd, data[offset:])
        os.fsync(file_fd)
        return os.fstat(file_fd)
    finally:
        os.close(file_fd)


def install_staged_file(
    staging_fd: int,
    output_fd: int,
    name: str,
    staged_status: os.stat_result,
) -> None:
    installed_fd: int | None = None
    try:
        os.replace(
            name,
            name,
            src_dir_fd=staging_fd,
            dst_dir_fd=output_fd,
        )
        installed_fd = os.open(
            name,
            os.O_RDONLY
            | getattr(os, "O_NONBLOCK", 0)
            | getattr(os, "O_CLOEXEC", 0)
            | getattr(os, "O_NOFOLLOW", 0),
            dir_fd=output_fd,
        )
        installed_status = os.fstat(installed_fd)
        if (
            not stat.S_ISREG(installed_status.st_mode)
            or installed_status.st_dev != staged_status.st_dev
            or installed_status.st_ino != staged_status.st_ino
        ):
            raise OSError(f"installed generated file changed unexpectedly: {name}")
    except OSError:
        try:
            os.unlink(name, dir_fd=output_fd)
        except FileNotFoundError:
            pass
        raise
    finally:
        if installed_fd is not None:
            os.close(installed_fd)


def write_site(review_fd: int, output_name: str, expected: dict[str, str]) -> None:
    with opened_output_dir(review_fd, output_name, create=True) as output_fd:
        staging_name, staging_fd = create_staging_dir(output_fd)
        try:
            staged = {
                name: write_staged_file(staging_fd, name, expected[name])
                for name in sorted(expected, key=lambda value: value.encode("utf-8"))
            }
            for name in sorted(staged, key=lambda value: value.encode("utf-8")):
                install_staged_file(staging_fd, output_fd, name, staged[name])
        finally:
            remove_staging_dir(output_fd, staging_name, staging_fd)

        for name in os.listdir(output_fd):
            if name in expected or Path(name).suffix not in {".html", ".css"}:
                continue
            entry_status = os.stat(name, dir_fd=output_fd, follow_symlinks=False)
            if stat.S_ISREG(entry_status.st_mode) or stat.S_ISLNK(entry_status.st_mode):
                os.unlink(name, dir_fd=output_fd)

        verify_output_binding(review_fd, output_name, output_fd)


def read_generated_file(output_fd: int, name: str) -> bytes | None:
    flags = (
        os.O_RDONLY
        | getattr(os, "O_NONBLOCK", 0)
        | getattr(os, "O_CLOEXEC", 0)
        | getattr(os, "O_NOFOLLOW", 0)
    )
    try:
        file_fd = os.open(name, flags, dir_fd=output_fd)
    except OSError:
        return None
    if not stat.S_ISREG(os.fstat(file_fd).st_mode):
        os.close(file_fd)
        return None
    with os.fdopen(file_fd, "rb") as stream:
        return stream.read()


def check_site(review_fd: int, output_name: str, expected: dict[str, str]) -> list[str]:
    problems: list[str] = []
    try:
        context = opened_output_dir(review_fd, output_name, create=False)
        output_fd = context.__enter__()
    except FileNotFoundError:
        return [
            f"missing generated file: {name}"
            for name in sorted(expected, key=lambda value: value.encode("utf-8"))
        ]

    try:
        actual_names = {
            name
            for name in os.listdir(output_fd)
            if Path(name).suffix in {".html", ".css"}
        }
        verify_output_binding(review_fd, output_name, output_fd)

        expected_names = set(expected)
        for name in sorted(expected_names - actual_names):
            problems.append(f"missing generated file: {name}")
        for name in sorted(actual_names - expected_names):
            problems.append(f"stale generated file: {name}")
        for name in sorted(expected_names & actual_names):
            if read_generated_file(output_fd, name) != expected[name].encode("utf-8"):
                problems.append(f"generated file is out of date: {name}")
        verify_output_binding(review_fd, output_name, output_fd)
    finally:
        context.__exit__(None, None, None)
    return problems


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Render a provenance review package as static HTML."
    )
    parser.add_argument("review_dir", type=Path, help="Review package directory")
    parser.add_argument(
        "--output",
        type=Path,
        help="Output directory (default: REVIEW_DIR/html)",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Fail if generated output is missing, stale, or different",
    )
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    review_dir = lexical_absolute(args.review_dir)
    review_fd: int | None = None
    try:
        review_fd = open_directory_path(review_dir)
        output_dir = validated_output_dir(review_dir, args.output)
        expected = expected_site_from_fd(review_fd, review_dir)
    except (OSError, UnicodeError, ValueError) as error:
        print(f"render-review: ERROR: {error}", file=sys.stderr)
        if review_fd is not None:
            os.close(review_fd)
        return 2
    try:
        if args.check:
            problems = check_site(review_fd, output_dir.name, expected)
            if problems:
                for problem in problems:
                    print(f"render-review: ERROR: {problem}", file=sys.stderr)
                return 1
            verify_path_binding(review_dir, review_fd)
            print(f"render-review: OK: {output_dir}")
            return 0

        write_site(review_fd, output_dir.name, expected)
        verify_path_binding(review_dir, review_fd)
    except OSError as error:
        print(f"render-review: ERROR: {error}", file=sys.stderr)
        return 2
    finally:
        os.close(review_fd)
    print(f"render-review: wrote {len(expected)} files to {output_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
