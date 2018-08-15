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

../cleos.sh multisig approve lioninjungle deploysudo '{"actor": "'$PROPOSER'", "permission": "active"}' -p $PROPOSER


../cleos.sh multisig approve lioninjungle deploysudo '{"actor": "lioninjungl1", "permission": "active"}' -p lioninjungl1
../cleos.sh multisig approve lioninjungle deploysudo '{"actor": "lioninjungl2", "permission": "active"}' -p lioninjungl2
../cleos.sh multisig approve lioninjungle deploysudo '{"actor": "lioninjungl3", "permission": "active"}' -p lioninjungl3
../cleos.sh multisig approve lioninjungle deploysudo '{"actor": "lioninjungl4", "permission": "active"}' -p lioninjungl4
../cleos.sh multisig approve lioninjungle deploysudo '{"actor": "lioninjungl5", "permission": "active"}' -p lioninjungl5