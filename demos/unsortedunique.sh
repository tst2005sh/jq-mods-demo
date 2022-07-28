
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload unsortedunique :call '
(
	["foo","bar","foo","bar"] |
	unsortedunique == ["foo","bar"]
),(
	["foo","bar","buz","foo","bar"] |
	unsortedunique == ["foo","bar","buz"]
),(

	["foo","bar","foo","bar","buz"] |
	unsortedunique == ["foo","bar","buz"]
)
' :run
