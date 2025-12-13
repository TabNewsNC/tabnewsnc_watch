.PHONY: icons splash upgrade clean

icons:
	@echo "Generating launcher icons..."
	@fvm dart run icons_launcher:create
	@fvm flutter pub run flutter_launcher_icons

splash:
	@echo "Generating splash screen..."
	@fvm dart run flutter_native_splash:create

upgrade:
	@echo "Upgrading project..."
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter pub upgrade
	@fvm flutter pub upgrade --major-versions

clean:
	@echo "Cleaning project..."
	@rm -rf dist/
	@fvm flutter clean
	@fvm flutter pub get
