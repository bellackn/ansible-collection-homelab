{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  languages.python = {
    enable = true;
    # This must satisfy the version constraints in pyproject.toml
    package = pkgs.python312;
    poetry = {
      enable = true;
      install = {
        enable = true;
      };
      activate.enable = true;
    };
  };

  dotenv.disableHint = true;
  difftastic.enable = true;
}
