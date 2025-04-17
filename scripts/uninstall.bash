#!/usr/bin/env bash

function main() {
  for f in $(find files -name '*.service'); do
    systemctl disable $(basename $f)
    rm -f /etc/systemd/system/$(basename $f)
  done

  systemctl daemon-reload
  systemctl reset-failed
}

main
