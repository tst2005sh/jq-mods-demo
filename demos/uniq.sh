
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload uniq :call '
(
	["","","foo","bar","","bar","foo",""] |
	uniq == ["","foo","bar","","bar","foo",""]
),(
	["foo","bar","foo","bar","buz"] |
	uniq == ["foo","bar","foo","bar","buz"]
)
' :run
