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

echo '{
   "creator": "eosio",
   "name": "eosio.sudo",
   "owner": {
      "threshold": 1,
      "keys": [],
      "accounts": [{
         "permission": {"actor": "eosio", "permission": "active"},
         "weight": 1
      }],
      "waits": []
   },
   "active": {
      "threshold": 1,
      "keys": [],
      "accounts": [{
         "permission": {"actor": "eosio", "permission": "active"},
         "weight": 1
      }],
      "waits": []
   }
}' > 1_02_newaccount_payload.json
