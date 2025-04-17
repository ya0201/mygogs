#!/usr/bin/env bash

function main() {
  if [[ ! -f /etc/gogs/postgres.env ]]; then
    mkdir -p /etc/gogs
    read -p "Enter the PostgreSQL password for user 'gogs': " gogs_pass
    cat <<EOF > /etc/gogs/postgres.env
POSTGRES_USER=gogs
POSTGRES_PASSWORD=$gogs_pass
POSTGRES_DB=gogs
EOF
    chown root:root /etc/gogs/postgres.env
    chmod 600 /etc/gogs/postgres.env
  fi

  for f in $(find files -name '*.service'); do
    cp $f /etc/systemd/system/
    systemctl enable --now $(basename $f)
  done
  systemctl daemon-reload
}

main
