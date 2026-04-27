RESUME_DIR ?= my-modular-resume
MAIN_FILE ?= $(RESUME_DIR)/resume.tex
OUT_DIR ?= build
OUT_PDF ?= $(OUT_DIR)/resume.pdf

.PHONY: build watch clean open serve check-tools

check-tools:
	@command -v tectonic >/dev/null || (echo "tectonic is required. Install: brew install tectonic" && exit 1)

build: check-tools
	@mkdir -p "$(OUT_DIR)"
	tectonic --keep-logs --synctex --outdir "$(OUT_DIR)" "$(MAIN_FILE)"

watch: check-tools
	@command -v watchexec >/dev/null || (echo "watchexec is required for watch mode. Install: brew install watchexec" && exit 1)
	watchexec -w "$(RESUME_DIR)" -e tex,sty --ignore "$(OUT_DIR)" -- "make build"

open:
	@command -v open >/dev/null || (echo "open command is not available on this OS" && exit 1)
	@[[ -f "$(OUT_PDF)" ]] || (echo "PDF not found. Run: make build" && exit 1)
	open "$(OUT_PDF)"

serve:
	@python3 -m http.server 8000 --directory "$(OUT_DIR)"

clean:
	rm -rf "$(OUT_DIR)"
