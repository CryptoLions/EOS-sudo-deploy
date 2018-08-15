#!/bin/bash
################################################################################################################
#
# Scrip Created by http://CryptoLions.io
# Sudo contract tests after eosio resign (creating sudo account, deploying contract, test sudo exec)
#
# https://github.com/CryptoLions/EOS-sudo-deploy
#
# 1_XX - eosio.sudo account creation
# 2_XX - eosio.sudo contract deploy
# 3_XX - eosio.sudo change permission test
#
# Get list active producers from eosio.prods and building requestedPermissions
#
# http://CryptoLions.io
################################################################################################################

requestedPermissions="";

PRODUCERS=$(../cleos.sh get account eosio.prods -j)
for row in $(echo "${PRODUCERS}" | jq -r '.permissions[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }

    perm_name=$(_jq '.perm_name')
    if [ "$perm_name" == "active" ]; then

        data_=$(_jq '.required_auth')

        #exit
        for accs in $(echo "${data_}" | jq -r '.accounts[] | @base64'); do
                _jq() {
                echo ${accs} | base64 --decode | jq -r ${1}
            }
            account=$(_jq '.permission.actor')
            permission=$(_jq '.permission.permission')

            #bp="$account@$permission"

            # Building requestedPermissions
            requestedPermission='{"actor": "'$account'", "permission": "'$permission'"}'

            if [ "$requestedPermissions" != "" ]; then
                requestedPermissions+=", "
            fi
            requestedPermissions+="$requestedPermission"
        done
        requestedPermissions="[$requestedPermissions]"

        echo $requestedPermissions | jq . > 1_06_sudo_producer_permissions.json
    fi
done
