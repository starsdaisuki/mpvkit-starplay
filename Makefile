# make only accept argument format: xxxx=xxxx, other format will treat as a target.
# add [enable-split-platform enable-debug enable-gpl] to .PHONY can ignore target not exist error.
.PHONY: help build gpl clean enable-split-platform enable-debug enable-gpl

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build [arguments]     Build the selected Apple platforms (the published package is iOS-only)"
	@echo "                        Arguments:"
	@echo "                            platform=ios,macos        Only build specified platform (ios,macos,tvos,tvsimulator,isimulator,maccatalyst,xros,xrsimulator)"
	@echo "                            enable-gpl                Complile to GPL version"
	@echo "  clean                 Clean the build artifacts"
	@echo "  help                  Display this help message"

build:
	swift run --build-path ./.build --package-path Sources/BuildScripts build $(filter-out $@,$(MAKECMDGOALS)) $(MAKEFLAGS)

gpl:
	swift run --build-path ./.build --package-path Sources/BuildScripts build enable-gpl $(filter-out $@,$(MAKECMDGOALS)) $(MAKEFLAGS)

clean:
	@find . -name '.build' -type d -prune -exec /usr/bin/trash {} +
	@find . -name '.swiftpm' -type d -prune -exec /usr/bin/trash {} +
	@test ! -e ./dist || /usr/bin/trash ./dist
	@find . -maxdepth 1 -name '*.log' -type f -exec /usr/bin/trash {} +
