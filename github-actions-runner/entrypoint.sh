#!/bin/sh -l

echo "GITHUB_PAT=$GITHUB_PAT"
echo "REGISTRATION_TOKEN_API_URL=$REGISTRATION_TOKEN_API_URL"
echo "Curl=curl -X POST -fsSL -H 'Accept: application/vnd.github.v3+json'  -H \"Authorization: Bearer $GITHUB_PAT\"  -H 'X-GitHub-Api-Version: 2022-11-28' \"$REGISTRATION_TOKEN_API_URL\" jq -r '.token')"
# Retrieve a short lived runner registration token using the PAT
REGISTRATION_TOKEN="$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/theonlyfaddyinc/my-second-repo/actions/runners/registration-token" \
  | jq -r '.token')"
# $(curl -X POST -fsSL \
#   -H 'Accept: application/vnd.github.v3+json' \
#   -H "Authorization: Bearer $GITHUB_PAT" \
#   -H 'X-GitHub-Api-Version: 2022-11-28' \
#   "$REGISTRATION_TOKEN_API_URL" \
  

  

./config.sh --url $REPO_URL --token $REGISTRATION_TOKEN --unattended --ephemeral && ./run.sh
