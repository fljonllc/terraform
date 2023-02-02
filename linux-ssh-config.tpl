cat << EOF >> ~/.ssh/config

Host ${hostname}
  HostName ${hostname}
  user ${user}
  IdentityFile ${identityfile}
EOF