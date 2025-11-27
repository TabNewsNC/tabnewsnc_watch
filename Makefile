.PHONY: icons runner upgrade clean

icons:
	@echo "Generating launcher icons"
	@fvm flutter pub run flutter_launcher_icons

runner:
	@echo "Running build-runner"
	@fvm dart run build_runner build -d

upgrade:
	@echo "Upgrading project"
	@fvm flutter pub get
	@fvm flutter pub upgrade
	@fvm flutter pub upgrade --major-versions

clean:
	@echo "Cleaning project"
	@rm -rf dist/
	@fvm flutter clean
	@fvm flutter pub get
