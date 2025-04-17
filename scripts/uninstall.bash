#!/usr/bin/env bash

function main() {
  systemctl disable mygogs.service
  rm -f /etc/systemd/system/mygogs.service

  systemctl daemon-reload
  systemctl reset-failed
}

main
