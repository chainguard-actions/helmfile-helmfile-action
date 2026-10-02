#!/bin/sh
# Fake helmfile binary for testing
# Responds to basic helmfile commands

case "$1" in
  version)
    echo "helmfile version v0.150.0"
    exit 0
    ;;
  list)
    echo "NAME\tNAMESPACE\tENABLED\tLABELS\tCHART\tVERSION"
    exit 0
    ;;
  invalid-subcommand-that-does-not-exist)
    echo "Error: unknown command \"invalid-subcommand-that-does-not-exist\" for \"helmfile\"" >&2
    exit 1
    ;;
  --file)
    # helmfile --file /nonexistent/path/helmfile.yaml list
    echo "Error: stat $2: no such file or directory" >&2
    exit 1
    ;;
  *)
    echo "helmfile: unknown command: $1" >&2
    exit 1
    ;;
esac
