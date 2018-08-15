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

../cleos.sh multisig propose_trx createsudo 1_06_sudo_producer_permissions.json 1_05_create_sudo_account_trx.json $PROPOSER
