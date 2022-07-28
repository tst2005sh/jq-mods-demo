
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload tohexstring :call '
(
[0,1,2,8,9,10,11,14,15]		| tohexstring=="01289abef"
),(
[0] | tohexstring=="0"
)
' :run
