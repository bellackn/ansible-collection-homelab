_default:
    @just --list

# updates version in galaxy.yml and creates changelog
[macos]
release VERSION:
    @sed -i '' -e 's/^version: .*$/version: {{VERSION}}/' galaxy.yml
    @antsibull-changelog release -v

# updates version in galaxy.yml and creates changelog
[linux]
release VERSION:
    @sed -i -e 's/version: .*$/version: {{VERSION}}/' galaxy.yml
    @antsibull-changelog release -v
alias r := release
