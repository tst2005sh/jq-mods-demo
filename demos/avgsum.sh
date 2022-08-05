
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload avgsum :call '
(
	[ 23, 45, 678, 13] |
	avgsum(tonumber) == {"min":13,"avg":189.75,"max":678,"sum":759,"count":4}
)
' :run
