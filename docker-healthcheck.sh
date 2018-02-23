#!/bin/sh

executeCommandQuietly() {
  $1 > /dev/null
  exitCode=$?
  if [ $exitCode -ne 0 ];
  then
    echo "ERROR: $2 (Code: $exitCode)"
    exit 1
  fi
}

executeCommandQuietly "curl --version" "curl is not present.  curl is not available within the environment path or is not installed."

if [ -z "$1" ];
then
  # URL command line argument is not provided, but is required, so exit.
  echo "ERROR: URL is required."
  exit 1
fi
URL="$1"

CURL_OPTS="--insecure --fail --silent --show-error -L -X GET --connect-timeout 5 --max-time 10"

curl $CURL_OPTS $URL
exitCode=$?
if [ $exitCode -eq 0 ];
then
  # Healthcheck request is healthy.
  exit 0
fi

# Healthcheck request is not healthy.
exit 1