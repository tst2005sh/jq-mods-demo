
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload fromhexstring :call '
(
"01289abef"			| fromhexstring==[0,1,2,8,9,10,11,14,15]
),(
"0" | fromhexstring==[0]
)
' :run
