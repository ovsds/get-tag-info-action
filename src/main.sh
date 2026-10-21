#!/bin/bash

set -euo pipefail

# shellcheck source-path=SCRIPTDIR source=common.sh
source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

function main() {
    OWNER=${OWNER:?"OWNER is not set"}
    REPO=${REPO:?"REPO is not set"}
    TAG_NAME=${TAG_NAME:?"TAG_NAME is not set"}
    REF_TYPE=${REF_TYPE:?"REF_TYPE is not set"}
    REF_SHA=${REF_SHA:?"REF_SHA is not set"}
    GH_TOKEN=${GH_TOKEN:?"GH_TOKEN is not set"}

    print_info "Getting ${REF_TYPE} info..."
    response=$( \
        gh api \
        -H "Accept: application/vnd.github+json" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "/repos/${OWNER}/${REPO}/git/${REF_TYPE}s/${REF_SHA}" \
    )

    commit_sha=""
    if [[ "${REF_TYPE}" == "tag" ]]; then
        commit_sha=$(echo "${response}" | jq -r '.object.sha')
    elif [[ "${REF_TYPE}" == "commit" ]]; then
        commit_sha=${REF_SHA}
    fi
    tag_message=$(echo "${response}" | jq -r '.message')
    verified=$(echo "${response}" | jq -r '.verification.verified')

    set_output "tag_name" "${TAG_NAME}"
    set_output "commit_sha" "${commit_sha}"
    set_output "tag_message" "${tag_message}"
    set_output "verified" "${verified}"
}

main "$@"
