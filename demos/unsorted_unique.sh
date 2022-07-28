
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload unsorted_unique :call '
(
	["foo","bar","foo","bar"] |
	unsorted_unique == ["foo","bar"]
),(
	["foo","bar","buz","foo","bar"] |
	unsorted_unique == ["foo","bar","buz"]
),(

	["foo","bar","foo","bar","buz"] |
	unsorted_unique == ["foo","bar","buz"]
)
' :run
