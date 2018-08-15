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

../cleos.sh multisig review $PROPOSER createsudo > 1_09_create_sudo_account_trx_to_review.json

echo "Expected:"
../cleos.sh multisig propose_trx -j -s -d createsudo '[]' 1_05_create_sudo_account_trx.json $PROPOSER | grep '"data":' | sed 's/^[ \t]*"data":[ \t]*//;s/[",]//g' | cut -c 35- > 1_09_expected_create_sudo_trx_serialized.hex
cat 1_09_expected_create_sudo_trx_serialized.hex

echo "Proposed:"
cat 1_09_create_sudo_account_trx_to_review.json | grep '"packed_transaction":' | sed 's/^[ \t]*"packed_transaction":[ \t]*//;s/[",]//g' > 1_09_proposed_create_sudo_trx_serialized.hex
cat 1_09_proposed_create_sudo_trx_serialized.hex

echo "Difference: "
diff 1_09_expected_create_sudo_trx_serialized.hex 1_09_proposed_create_sudo_trx_serialized.hex