#!/bin/sh

source ./.custom.tmux.env

version=1.0
startServerCmd='nvm use'

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
		startServerCmd="$startServerCmd && $privateStartServerCmd"
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

tmux new-session -n 'com' -c $HOME -s ivan \; \
	send-keys "cd ${path1} && ${startServerCmd}" C-m \; \
	split-window -h -c $path1 \; \
	split-window -v -c $path1 -t 0 \; \
	send-keys -t 1 'nvm use' C-m \; \
	send-keys -t 2 'nvm use' C-m \; \
	new-window -n 'webui' -c "${path2}" \; \
	split-window -h -c "${path2}"\; \
	send-keys -t 0 'nvm use' C-m \; \
	send-keys -t 1 'nvm use' C-m \; \
	new-window -n 'exp' -c "${path3}" \; \
	split-window -h -c "${path3}"\; \
	send-keys -t 0 'nvm use' C-m \; \
	send-keys -t 0 'npm run dev' C-m \; \
	send-keys -t 1 'nvm use' C-m \; \
	new-window -n 'stuff' -c "${path4}" \; \
	split-window -h -c "${path4}"\; \
	send-keys -t 0 'nvm use' C-m \; \
	send-keys -t 0 'npm run dev' C-m \; \
	send-keys -t 1 'nvm use' C-m \; \
