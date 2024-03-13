#!/usr/bin/env bash

FROM_VERSION=0.5.0
CHANGELOG_FILE=CHANGELOG.md

changelog() {
    local opts=$@

    if ! type -t git-cliff &>/dev/null
    then
        echo "git-cliff is required to generate the changelog" >&2
        return 1
    fi

    if [ -z "$opts" ]
    then
        echo "Using default opt --bump"
        opts="--bump"
    fi

    local changelog_details
    changelog_details=$(git-cliff $opts "$FROM_VERSION..")

    if [ -z "$changelog_details" ]
    then
        echo "Changelog generation failed" >&2
        return 2
    fi

    echo "$changelog_details" | uniq > "$CHANGELOG_FILE"

    echo "Changelog written to $CHANGELOG_FILE"
}

changelog "$@"
