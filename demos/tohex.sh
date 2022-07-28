
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload tohex :call '
(
0		| tohex == "0"
),(
1		| tohex == "1"
),(
256		| tohex == "100"
),(
255		| tohex == "ff"
),(
255		| tohex|ascii_upcase == "FF"
),(
17591936700415	| tohex == "ffff1234fff"
)
' :run
