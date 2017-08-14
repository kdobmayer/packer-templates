#!/bin/bash -eux
#
# disable DNS remote lookup, password authentication and root login

SSHD_CONFIG="/etc/ssh/sshd_config"

# ensure that there is a trailing newline before attempting to concatenate
sed -i -e '$a\' "$SSHD_CONFIG"

SSHD_SETTINGS=(UseDNS GSSAPIAuthentication PasswordAuthentication PermitRootLogin)

for config in "${SSHD_SETTINGS[@]}";
do
   if grep -q -E "^[[:space:]]*${config}" "$SSHD_CONFIG"; then
      sed -i "s/^\s*${config}.*/${config} no/" "$SSHD_CONFIG"
   else
      echo "${config} no" >>"$SSHD_CONFIG"
   fi
done

# remove DNS lookups completely
echo "OPTIONS=\"-u0\"" >> /etc/sysconfig/sshd
