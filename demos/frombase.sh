
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload frombase :call '
	[0,1,1,1] | frombase(2) == 14
' :run
