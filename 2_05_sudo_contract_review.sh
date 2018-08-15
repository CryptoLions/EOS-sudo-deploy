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

../cleos.sh multisig review $PROPOSER deploysudo > 2_05_deploy_sudo_contract_trx_to_review.json

echo "Expected:"
../cleos.sh multisig propose_trx -j -s -d deploysudo '[]' 2_02_deploy_sudo_contract_trx.json $PROPOSER | grep '"data":' | sed 's/^[ \t]*"data":[ \t]*//;s/[",]//g' | cut -c 35- > 2_05_expected_deploy_sudo_trx_serialized.hex
cat 2_05_expected_deploy_sudo_trx_serialized.hex | cut -c -50

echo "Proposed:"
cat 2_05_deploy_sudo_contract_trx_to_review.json | grep '"packed_transaction":' | sed 's/^[ \t]*"packed_transaction":[ \t]*//;s/[",]//g' > 2_05_proposed_deploy_sudo_trx_serialized.hex
cat 2_05_proposed_deploy_sudo_trx_serialized.hex | cut -c -50

echo "Difference: "
diff 2_05_expected_deploy_sudo_trx_serialized.hex 2_05_proposed_deploy_sudo_trx_serialized.hex