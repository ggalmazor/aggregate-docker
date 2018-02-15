#!/usr/bin/env bash
set -e

wait_for_port() {
  echo Waiting for port $1...
  while ! nc -z localhost $1; do echo sleeping; sleep 2; done
}

/usr/local/bin/docker-entrypoint.sh postgres &
sleep 5
wait_for_port 5432
/opt/tomcat/bin/catalina.sh run