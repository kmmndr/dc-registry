#!/bin/sh
set -eu

stage=${1:-'default'}

cat <<EOF
COMPOSE_PROJECT_NAME=registry
EOF

case "$stage" in
	"default")
		cat <<-EOF
		EOF
		;;

	"production")
		cat <<-EOF
		EOF
		;;

	*)
		echo "Unknown stage $stage" >&2
		exit 1
		;;
esac
