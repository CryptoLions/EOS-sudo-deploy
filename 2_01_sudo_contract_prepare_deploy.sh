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

COMPILED_SUDO_CONTRACT="$( jq -r '.COMPILED_SUDO_CONTRACT' "00_config.json" )"

../cleos.sh set contract -s -j -d eosio.sudo $COMPILED_SUDO_CONTRACT > 2_01_deploy_sudo_contract_trx.json

cat 2_01_deploy_sudo_contract_trx.json