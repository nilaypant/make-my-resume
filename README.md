# make-my-resume
A LaTeX powered resume maintainer and Builder, inspired by Overleaf. Tight local-first LaTeX system with GitHub sync + auto-render + optional web preview.

## Workflow
Mac (local dev)
   ↓
Git (version control)
   ↓
GitHub (remote backup + history)
   ↓
Auto LaTeX build (PDF)
   ↓
Optional: GitHub Pages (web preview)

## Quick Start

```bash
brew install tectonic watchexec
make build
make watch
```

Local output goes to `build/resume.pdf` at repo root.

CI/CD workflow is configured at `.github/workflows/resume-ci.yml` and builds `my-modular-resume/resume.tex` automatically on push/PR.
