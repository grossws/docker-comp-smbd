#!/bin/bash

trap 'kill -TERM $PID ; wait $PID' TERM INT

if [ "$1" = "smbd" ] ; then
  shift
  if [ "$1" == "--" ] ; then
    shift
  fi

  smbd -F -S -s /smb.conf "$@" &

  PID=$!
  wait $PID
  wait $PID
  exit $?
fi

exec "$@"

