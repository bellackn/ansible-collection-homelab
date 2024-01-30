_default:
    @just --list

# updates version in galaxy.yml and creates changelog
release VERSION:
    @sed -i -e 's/^version: .*$/version: {{VERSION}}/' galaxy.yml
    @antsibull-changelog release
alias r := release
