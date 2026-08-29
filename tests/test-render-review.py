#!/usr/bin/env python3

"""Tests for the dependency-free review renderer."""

from __future__ import annotations

import importlib.util
import os
import subprocess
import sys
import tempfile
import unittest
from unittest import mock
from pathlib import Path


sys.dont_write_bytecode = True

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
RENDERER_PATH = REPOSITORY_ROOT / "scripts" / "render-review.py"
REAL_REVIEW = (
    REPOSITORY_ROOT
    / "reviews"
    / "PRV-20260828-001-helium-te-security-architecture"
)

SPEC = importlib.util.spec_from_file_location("render_review", RENDERER_PATH)
assert SPEC and SPEC.loader
render_review = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = render_review
SPEC.loader.exec_module(render_review)


class RenderReviewTests(unittest.TestCase):
    def setUp(self) -> None:
        self.temporary_directory = tempfile.TemporaryDirectory()
        self.review_dir = Path(self.temporary_directory.name) / "PRV-20000101-001-test"
        self.review_dir.mkdir()
        (self.review_dir / "HANDOFF.md").write_text(
            """\
# Handoff

Raw <script>alert("no")</script> <!-- comment --> <svg onload="bad"></svg>
Placeholder @@REVIEW_ID@@ and <iframe src="https://example.com"></iframe>.

[HTTPS](https://example.com/a?b=1) [HTTP](http://example.com)
[Mail](mailto:test@example.invalid) [Fragment](#repeat)
[Local](report.md#repeat) [JavaScript](javascript:alert(1))
[Data](data:text/html,bad) [File](file:///tmp/bad) [Unknown](target://thing)
[Protocol relative](//example.com) [Absolute](/tmp/bad)
[Backslash](folder\\bad.md) [Traversal](../outside.md)

Plain https://example.com/plain. Locators target://one workspace://two review:three.

## Repeat
## Repeat

- parent
  - child
- [x] complete
- [ ] incomplete

1. first
2. second

> Quoted **strong** text.

---

| Name | Value |
| --- | --- |
| one | `two` |

```html
<iframe src="https://example.com"></iframe>
```
""",
            encoding="utf-8",
        )
        (self.review_dir / "source-scope-summary.md").write_text(
            "# Source scope\n\nSummary.\n", encoding="utf-8"
        )
        (self.review_dir / "prior-art-summary.md").write_text(
            """\
# Prior art summary

Latest iteration: `PRIOR-ART-ITERATION-001`

## Current at-a-glance projection

- Based on iteration: PRIOR-ART-ITERATION-001
""",
            encoding="utf-8",
        )
        (self.review_dir / "report.md").write_text(
            "# Report\n\nSafe *emphasis* and **strong** text.\n", encoding="utf-8"
        )

    def tearDown(self) -> None:
        self.temporary_directory.cleanup()

    def run_cli(self, *arguments: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            [sys.executable, str(RENDERER_PATH), *arguments],
            check=False,
            capture_output=True,
            text=True,
        )

    def test_rendering_is_safe_accessible_and_complete(self) -> None:
        expected = render_review.expected_site(self.review_dir)
        handoff = expected["HANDOFF.html"]
        index = expected["index.html"]

        self.assertIn("&lt;script&gt;", handoff)
        self.assertIn("&lt;!-- comment --&gt;", handoff)
        self.assertIn("@@REVIEW_ID@@", handoff)
        self.assertIn("&lt;iframe", handoff)
        self.assertNotIn("<script", handoff)
        self.assertNotIn("<svg", handoff)
        self.assertNotIn("<iframe", handoff)
        self.assertNotIn('href="javascript:', handoff)
        self.assertNotIn('href="data:', handoff)
        self.assertNotIn('href="file:', handoff)
        self.assertNotIn('href="target:', handoff)
        self.assertNotIn('href="//', handoff)
        self.assertNotIn('href="/tmp', handoff)
        self.assertNotIn('href="../outside', handoff)
        self.assertIn('href="https://example.com/a?b=1"', handoff)
        self.assertIn('href="http://example.com"', handoff)
        self.assertIn('href="mailto:test@example.invalid"', handoff)
        self.assertIn('href="#repeat"', handoff)
        self.assertIn('href="./report.html#repeat"', handoff)
        self.assertIn('href="https://example.com/plain"', handoff)
        self.assertNotIn('href="target://one"', handoff)
        self.assertNotIn('href="workspace://two"', handoff)
        self.assertNotIn('href="review:three"', handoff)

        self.assertIn('id="repeat"', handoff)
        self.assertIn('id="repeat-2"', handoff)
        self.assertIn('class="toc"', handoff)
        self.assertIn("<ul>", handoff)
        self.assertIn("<ol>", handoff)
        self.assertIn('class="task-list"', handoff)
        self.assertIn('type="checkbox" disabled checked', handoff)
        self.assertIn("<blockquote>", handoff)
        self.assertIn("<pre><code>", handoff)
        self.assertIn("<table>", handoff)
        self.assertIn('<th scope="col">', handoff)
        self.assertIn("<caption", handoff)
        self.assertIn('<html lang="en">', handoff)
        self.assertIn('<meta charset="utf-8">', handoff)
        self.assertIn('class="skip-link"', handoff)
        self.assertIn("<main ", handoff)
        self.assertIn("<article ", handoff)
        self.assertIn("<nav ", handoff)
        self.assertIn("<footer ", handoff)
        self.assertIn('href="../HANDOFF.md"', handoff)

        expected_pages = {
            "HANDOFF.html",
            "prior-art-summary.html",
            "source-scope-summary.html",
            "report.html",
        }
        self.assertEqual(expected_pages | {"index.html", "site.css"}, set(expected))
        positions = [index.index(f'href="./{name}"') for name in expected_pages]
        self.assertLess(index.index('href="./HANDOFF.html"'), index.index(
            'href="./prior-art-summary.html"'
        ))
        self.assertLess(index.index('href="./prior-art-summary.html"'), index.index(
            'href="./source-scope-summary.html"'
        ))
        self.assertLess(index.index('href="./source-scope-summary.html"'), index.index(
            'href="./report.html"'
        ))
        self.assertEqual(4, len(positions))
        self.assertIn(
            "Latest iteration: <code>PRIOR-ART-ITERATION-001</code>",
            expected["prior-art-summary.html"],
        )
        self.assertNotIn("http://", expected["site.css"])
        self.assertNotIn("https://", expected["site.css"])
        self.assertNotIn("url(", expected["site.css"])
        for name, content in expected.items():
            if name.endswith(".html"):
                self.assertNotIn("<script", content)
                self.assertNotIn("<img", content)
                self.assertNotRegex(content, r'<link[^>]+href="https?://')

    def test_generation_is_deterministic_and_removes_stale_outputs(self) -> None:
        output_dir = self.review_dir / "html"
        first = self.run_cli(str(self.review_dir))
        self.assertEqual(0, first.returncode, first.stderr)
        original = {
            path.name: path.read_bytes()
            for path in output_dir.iterdir()
            if path.is_file()
        }

        (output_dir / "stale.html").write_text("stale", encoding="utf-8")
        (output_dir / "stale.css").write_text("stale", encoding="utf-8")
        (output_dir / "keep.txt").write_text("keep", encoding="utf-8")
        second = self.run_cli(str(self.review_dir))
        self.assertEqual(0, second.returncode, second.stderr)

        rerendered = {
            path.name: path.read_bytes()
            for path in output_dir.iterdir()
            if path.is_file() and path.suffix in {".html", ".css"}
        }
        self.assertEqual(original, rerendered)
        self.assertFalse((output_dir / "stale.html").exists())
        self.assertFalse((output_dir / "stale.css").exists())
        self.assertTrue((output_dir / "keep.txt").exists())
        for content in rerendered.values():
            self.assertNotIn(b"\r\n", content)
            self.assertNotIn(str(self.review_dir).encode(), content)

    def test_check_reports_success_and_failure(self) -> None:
        generated = self.run_cli(str(self.review_dir))
        self.assertEqual(0, generated.returncode, generated.stderr)
        current = self.run_cli("--check", str(self.review_dir))
        self.assertEqual(0, current.returncode, current.stderr)

        (self.review_dir / "html" / "report.html").write_text(
            "changed\n", encoding="utf-8"
        )
        changed = self.run_cli("--check", str(self.review_dir))
        self.assertEqual(1, changed.returncode)
        self.assertIn("generated file is out of date: report.html", changed.stderr)

        (self.review_dir / "html" / "report.html").unlink()
        missing = self.run_cli("--check", str(self.review_dir))
        self.assertEqual(1, missing.returncode)
        self.assertIn("missing generated file: report.html", missing.stderr)

        regenerated = self.run_cli(str(self.review_dir))
        self.assertEqual(0, regenerated.returncode, regenerated.stderr)
        (self.review_dir / "html" / "stale.html").write_text(
            "stale\n", encoding="utf-8"
        )
        stale = self.run_cli("--check", str(self.review_dir))
        self.assertEqual(1, stale.returncode)
        self.assertIn("stale generated file: stale.html", stale.stderr)

    @unittest.skipUnless(hasattr(os, "mkfifo"), "FIFO test requires os.mkfifo")
    def test_check_rejects_fifo_without_blocking(self) -> None:
        generated = self.run_cli(str(self.review_dir))
        self.assertEqual(0, generated.returncode, generated.stderr)
        report = self.review_dir / "html" / "report.html"
        report.unlink()
        os.mkfifo(report)

        checked = subprocess.run(
            [sys.executable, str(RENDERER_PATH), "--check", str(self.review_dir)],
            check=False,
            capture_output=True,
            text=True,
            timeout=3,
        )

        self.assertEqual(1, checked.returncode)
        self.assertIn("generated file is out of date: report.html", checked.stderr)

    def test_check_detects_output_directory_swap_during_reads(self) -> None:
        generated = self.run_cli(str(self.review_dir))
        self.assertEqual(0, generated.returncode, generated.stderr)
        output_dir = self.review_dir / "html"
        moved_output = self.review_dir / "html-original"
        attacker_output = self.review_dir / "html-attacker"
        attacker_output.mkdir()
        (attacker_output / "index.html").write_text(
            "attacker\n", encoding="utf-8"
        )
        original_read = render_review.read_generated_file
        swapped = False

        def swap_output(output_fd: int, name: str) -> bytes | None:
            nonlocal swapped
            content = original_read(output_fd, name)
            if not swapped:
                output_dir.rename(moved_output)
                attacker_output.rename(output_dir)
                swapped = True
            return content

        with mock.patch.object(
            render_review, "read_generated_file", side_effect=swap_output
        ):
            result = render_review.main(["--check", str(self.review_dir)])

        self.assertEqual(2, result)
        self.assertEqual(
            "attacker\n",
            (output_dir / "index.html").read_text(encoding="utf-8"),
        )

    def test_symlinked_markdown_is_not_rendered(self) -> None:
        outside = Path(self.temporary_directory.name) / "outside.md"
        outside.write_text("# Outside\n", encoding="utf-8")
        (self.review_dir / "linked.md").symlink_to(outside)
        expected = render_review.expected_site(self.review_dir)
        self.assertNotIn("linked.html", expected)
        self.assertNotIn('href="linked.html"', expected["index.html"])

    def test_source_symlink_replacement_after_discovery_is_rejected(self) -> None:
        outside = Path(self.temporary_directory.name) / "outside-source.md"
        outside.write_text("# Outside\n\nLEAK_MARKER\n", encoding="utf-8")
        report = self.review_dir / "report.md"
        original_discovery = render_review.discover_markdown_names

        def replace_source(review_fd: int) -> list[str]:
            names = original_discovery(review_fd)
            report.unlink()
            report.symlink_to(outside)
            return names

        with mock.patch.object(
            render_review, "discover_markdown_names", side_effect=replace_source
        ):
            result = render_review.main([str(self.review_dir)])

        self.assertEqual(2, result)
        self.assertFalse((self.review_dir / "html").exists())

    @unittest.skipUnless(hasattr(os, "mkfifo"), "FIFO test requires os.mkfifo")
    def test_source_fifo_replacement_after_discovery_is_rejected(self) -> None:
        report = self.review_dir / "report.md"
        original_discovery = render_review.discover_markdown_names

        def replace_source(review_fd: int) -> list[str]:
            names = original_discovery(review_fd)
            report.unlink()
            os.mkfifo(report)
            return names

        with mock.patch.object(
            render_review, "discover_markdown_names", side_effect=replace_source
        ):
            result = render_review.main([str(self.review_dir)])

        self.assertEqual(2, result)
        self.assertFalse((self.review_dir / "html").exists())

    def test_symlinked_output_directory_is_rejected(self) -> None:
        outside = Path(self.temporary_directory.name) / "outside-output"
        outside.mkdir()
        victim = outside / "victim.html"
        victim.write_text("keep\n", encoding="utf-8")
        (self.review_dir / "html").symlink_to(outside, target_is_directory=True)

        result = self.run_cli(str(self.review_dir))

        self.assertEqual(2, result.returncode)
        self.assertIn("output path contains a symbolic link", result.stderr)
        self.assertEqual("keep\n", victim.read_text(encoding="utf-8"))
        self.assertEqual(["victim.html"], sorted(path.name for path in outside.iterdir()))

    def test_output_replacement_after_validation_is_rejected(self) -> None:
        outside = Path(self.temporary_directory.name) / "outside-race"
        outside.mkdir()
        victim = outside / "victim.html"
        victim.write_text("keep\n", encoding="utf-8")
        output_dir = self.review_dir / "html"
        output_dir.mkdir()
        original_expected_site = render_review.expected_site_from_fd

        def replace_output(review_fd: int, review_dir: Path) -> dict[str, str]:
            expected = original_expected_site(review_fd, review_dir)
            output_dir.rmdir()
            output_dir.symlink_to(outside, target_is_directory=True)
            return expected

        with mock.patch.object(
            render_review, "expected_site_from_fd", side_effect=replace_output
        ):
            result = render_review.main([str(self.review_dir)])

        self.assertEqual(2, result)
        self.assertEqual("keep\n", victim.read_text(encoding="utf-8"))
        self.assertEqual(["victim.html"], sorted(path.name for path in outside.iterdir()))

    def test_reserved_index_output_collision_is_rejected(self) -> None:
        (self.review_dir / "index.md").write_text(
            "# Document named index\n", encoding="utf-8"
        )

        result = self.run_cli(str(self.review_dir))

        self.assertEqual(2, result.returncode)
        self.assertIn(
            "index.md -> index.html",
            result.stderr,
        )
        self.assertFalse((self.review_dir / "html").exists())

    def test_generated_filename_links_are_relative_and_encoded(self) -> None:
        unsafe_names = (
            "javascript:alert(1).md",
            "hash#name.md",
            "query?name.md",
            "percent%name.md",
        )
        for name in unsafe_names:
            (self.review_dir / name).write_text(f"# {name}\n", encoding="utf-8")

        expected = render_review.expected_site(self.review_dir)
        index = expected["index.html"]

        self.assertIn('href="./javascript%3Aalert%281%29.html"', index)
        self.assertIn('href="./hash%23name.html"', index)
        self.assertIn('href="./query%3Fname.html"', index)
        self.assertIn('href="./percent%25name.html"', index)
        self.assertNotIn('href="javascript:', index)

    def test_staging_replacement_is_detected_and_removed(self) -> None:
        outside = Path(self.temporary_directory.name) / "attacker.html"
        outside.write_text("attacker\n", encoding="utf-8")
        original_replace = render_review.os.replace
        replaced = False

        def replace_staged(
            source: str,
            destination: str,
            *,
            src_dir_fd: int,
            dst_dir_fd: int,
        ) -> None:
            nonlocal replaced
            if not replaced:
                render_review.os.unlink(source, dir_fd=src_dir_fd)
                render_review.os.symlink(outside, source, dir_fd=src_dir_fd)
                replaced = True
            original_replace(
                source,
                destination,
                src_dir_fd=src_dir_fd,
                dst_dir_fd=dst_dir_fd,
            )

        with mock.patch.object(render_review.os, "replace", side_effect=replace_staged):
            result = render_review.main([str(self.review_dir)])

        self.assertEqual(2, result)
        generated = self.review_dir / "html"
        self.assertTrue(generated.is_dir())
        self.assertFalse(any(path.is_symlink() for path in generated.iterdir()))
        self.assertNotIn(
            "attacker",
            "\n".join(
                path.read_text(encoding="utf-8")
                for path in generated.iterdir()
                if path.is_file()
            ),
        )

    def test_review_ancestor_replacement_does_not_redirect_output(self) -> None:
        root = Path(self.temporary_directory.name) / "ancestor-race"
        original_parent = root / "original"
        review = original_parent / "review"
        review.mkdir(parents=True)
        (review / "HANDOFF.md").write_text("# Handoff\n", encoding="utf-8")
        redirected_parent = root / "redirected"
        redirected_review = redirected_parent / "review"
        redirected_review.mkdir(parents=True)
        moved_parent = root / "moved"
        original_expected_site = render_review.expected_site_from_fd

        def replace_ancestor(review_fd: int, review_dir: Path) -> dict[str, str]:
            expected = original_expected_site(review_fd, review_dir)
            original_parent.rename(moved_parent)
            original_parent.symlink_to(redirected_parent, target_is_directory=True)
            return expected

        with mock.patch.object(
            render_review, "expected_site_from_fd", side_effect=replace_ancestor
        ):
            result = render_review.main([str(review)])

        self.assertEqual(2, result)
        self.assertFalse((redirected_review / "html").exists())
        self.assertTrue((moved_parent / "review" / "html" / "index.html").is_file())

    def test_committed_real_site_is_current(self) -> None:
        result = self.run_cli("--check", str(REAL_REVIEW))
        self.assertEqual(0, result.returncode, result.stderr)
        ledger = (REAL_REVIEW / "html" / "evidence-ledger.html").read_text(
            encoding="utf-8"
        )
        prior_art = (REAL_REVIEW / "html" / "prior-art-summary.html").read_text(
            encoding="utf-8"
        )
        index = (REAL_REVIEW / "html" / "index.html").read_text(encoding="utf-8")
        self.assertIn("PRV-20260828-001-E0127", ledger)
        self.assertIn("PRIOR-ART-ITERATION-001", prior_art)
        self.assertLess(
            index.index('href="./HANDOFF.html"'),
            index.index('href="./prior-art-summary.html"'),
        )
        self.assertLess(
            index.index('href="./prior-art-summary.html"'),
            index.index('href="./source-scope-summary.html"'),
        )


if __name__ == "__main__":
    unittest.main()
