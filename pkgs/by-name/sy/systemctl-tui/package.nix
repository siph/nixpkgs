{ lib
, rustPlatform
, fetchCrate
, stdenv
, darwin
}:

rustPlatform.buildRustPackage rec {
  pname = "systemctl-tui";
  version = "0.3.1";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-kioQvtHpKg4/oY5IWQd29dGkRnXNjvE0wKea1s7i5MA=";
  };

  cargoHash = "sha256-X9+zbNJYma7pbXVWdF+poeFTPXRRWcAvQsqiO4dRt58=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
  ];

  meta = with lib; {
    description = "A simple TUI for interacting with systemd services and their logs";
    homepage = "https://crates.io/crates/systemctl-tui";
    license = licenses.mit;
    maintainers = with maintainers; [ siph ];
    mainProgram = "systemctl-tui";
  };
}
