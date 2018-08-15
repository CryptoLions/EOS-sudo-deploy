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


actions01=$(cat 1_01_generated_account_creation_trx.json | jq -c 'del(.actions[] | select(.name == "newaccount"))' | jq .actions)  #'
actions02=$(cat 1_04_generated_setpriv_trx.json | jq .actions)

#next week +1 week
tx_delay="$(date -d "+1 week" +%Y-%m-%dT12:00:00)"

jq -c '.expiration=$tx_delay | .ref_block_num=0 | .ref_block_prefix=0 | .actions += '"$actions01"' | .actions += '"$actions02" --arg tx_delay "$tx_delay" 1_03_generated_newaccount_trx.json | jq . > 1_05_create_sudo_account_trx.json



