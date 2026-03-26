#!/bin/bash
# Outputs an environment-specific variable value based on the project directory.
# Used as an Atlantis env step command — stdout becomes the variable value.
# Usage: setup-env.sh <VARIABLE_SUFFIX>
# Example: setup-env.sh AUTH0_CLIENT_ID → resolves DEV_AUTH0_CLIENT_ID for dev

ENV="${REPO_REL_DIR##*/}"
ENV_UPPER=$(echo "${ENV}" | tr '[:lower:]' '[:upper:]')
eval echo "\$${ENV_UPPER}_${1}"
