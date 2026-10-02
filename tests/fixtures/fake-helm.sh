#!/bin/sh
# Fake helm binary for testing
# Responds to basic helm commands

case "$1" in
  version)
    echo "v3.11.0+gc91992b"
    exit 0
    ;;
  plugin)
    case "$2" in
      install)
        echo "Installed plugin: diff"
        exit 0
        ;;
      list)
        echo "NAME\tVERSION\tDESCRIPTION"
        echo "diff\t3.6.0\tA Helm plugin to show diff"
        exit 0
        ;;
      *)
        echo "helm plugin: unknown subcommand: $2" >&2
        exit 1
        ;;
    esac
    ;;
  env)
    if [ "$2" = "HELM_PLUGINS" ]; then
      echo "/root/.local/share/helm/plugins"
    fi
    exit 0
    ;;
  *)
    echo "helm: unknown command: $1" >&2
    exit 1
    ;;
esac
