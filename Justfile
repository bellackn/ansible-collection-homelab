antsibull := 'pipenv run antsibull-changelog'

_default:
    @just --list

# updates version in galaxy.yml and creates changelog
release VERSION:
    @sed -i -e 's/^version: .*$/version: {{VERSION}}/' galaxy.yml
    @{{antsibull}} release
alias r := release
