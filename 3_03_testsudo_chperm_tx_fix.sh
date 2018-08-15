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

#tx_delay="$(date -d "+1 week" +%Y-%m-%dT12:00:00)"
tx_delay="1970-01-01T00:00:00"

jq -c '.expiration=$tx_delay | .ref_block_num=0 | .ref_block_prefix=0' --arg tx_delay "$tx_delay" 3_02_update_tester_owner_trx.json | jq . > 3_03_update_tester_owner_trx.json

cat 3_03_update_tester_owner_trx.json
