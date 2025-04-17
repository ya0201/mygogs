#!/usr/bin/env bash

function main() {
  cp files/mygogs.service /etc/systemd/system/
  systemctl enable --now mygogs.service
  systemctl daemon-reload
}

main
