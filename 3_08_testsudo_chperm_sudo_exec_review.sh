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

../cleos.sh multisig review $PROPOSER updatetester > 3_08_sudo_update_tester_owner_trx_to_review.json

cat 3_08_sudo_update_tester_owner_trx_to_review.json


../cleos.sh multisig propose_trx -j -s -d updatetester '[]' 3_05_sudo_update_tester_owner_trx.json $PROPOSER | grep '"data":' | sed 's/^[ \t]*"data":[ \t]*//;s/[",]//g' | cut -c 35- > 3_08_expected_sudo_update_tester_owner_trx_serialized.hex

echo "Expected:"
cat 3_08_expected_sudo_update_tester_owner_trx_serialized.hex

cat 3_08_sudo_update_tester_owner_trx_to_review.json | grep '"packed_transaction":' | sed 's/^[ \t]*"packed_transaction":[ \t]*//;s/[",]//g' > 3_08_proposed_sudo_update_tester_owner_trx_serialized.hex
echo "Proposed:"
cat 3_08_proposed_sudo_update_tester_owner_trx_serialized.hex
echo "Difference: "
diff 3_08_expected_sudo_update_tester_owner_trx_serialized.hex 3_08_proposed_sudo_update_tester_owner_trx_serialized.hex






