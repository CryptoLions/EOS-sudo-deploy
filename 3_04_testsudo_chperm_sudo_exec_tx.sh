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
#
# http://CryptoLions.io
################################################################################################################

PROPOSER="$( jq -r '.PROPOSER' "00_config.json" )"

../cleos.sh sudo exec -s -j -d $PROPOSER 3_03_update_tester_owner_trx.json > 3_04_sudo_update_tester_owner_trx.json

