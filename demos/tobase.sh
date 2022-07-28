
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload tobase :call '
(
	14 | tobase(2)== [0,1,1,1]
),(
	0 | tobase(2)== [0]
)
' :run
