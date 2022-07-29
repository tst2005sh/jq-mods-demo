
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload abs :call '
(	123	| abs ==123
),(	-123	| abs ==123
),(	1.23	| abs ==1.23
),(	0	| abs == 0
),(	-0	| abs == 0
),(	12345.3 | abs ==12345.3
)
' :run
