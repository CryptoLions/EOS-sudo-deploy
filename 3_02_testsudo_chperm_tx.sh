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
CHANGE_PERMISSION_FOR="testertester"

../cleos.sh set account permission -s -j -d $CHANGE_PERMISSION_FOR owner '{"threshold": 1, "accounts": [{"permission": {"actor": "eosio", "permission": "active"}, "weight": 1}]}' > 3_02_update_tester_owner_trx.json


