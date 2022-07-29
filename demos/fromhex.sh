
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload fromhex :call '
(
"0"		| fromhex == 0
),(
"001"		| fromhex == 1
),(
"100"		| fromhex == 256
),(
"ff"		| fromhex == 255
),(
"FF"		| fromhex == 255
),(
"FFFF1234fff"	| fromhex == 17591936700415
)
' :run
