cat << EOF >> terraform/config

Host ${hostname}
  HostName ${hostname}
  user ${user}
  IdentityFile ${identityfile}
EOF
