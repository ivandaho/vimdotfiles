#!/bin/sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/.custom.tmux.env"

version=1.0
nvmUse='nvm use'
startServerCmd0="echo ''"
startServerCmd1="echo ''"
startServerCmd2="echo ''"

# get options
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version )
    echo "$version"
    exit
    ;;
	# -s | --string )
  #   shift; string=$1
  #   ;;
  -s | --start-server )
		startServerCmd0="$nvmUse && $privateStartServerCmd0"
		startServerCmd1="$privateStartServerCmd1"
		startServerCmd2="$nvmUse && $privateStartServerCmd2"
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

tmux new-session -n 'actual' -c $HOME -s ivan \; \
	send-keys "cd ${path0} && ${startServerCmd0}" C-m \; \
	split-window -h -c $path0 \; \
	send-keys -t 1 "${nvmUse}" C-m \; \
  \
	new-window -n 'fastapi-transaction-server' -c "${path1}" \; \
	split-window -h -c "${path1}"\; \
	send-keys -t 0 "${startServerCmd1}" C-m \; \
  \
	new-window -n 'transaction-syncer-fe' -c "${path2}" \; \
	split-window -h -c "${path2}"\; \
	send-keys -t 0 "${startServerCmd2}" C-m \; \
	send-keys -t 2 "${nvmUse}" C-m \; \
  \
	new-window -n 'ocr' -c "${path3}" \; \
	split-window -h -c "${path3}"\;

