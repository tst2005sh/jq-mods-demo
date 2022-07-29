
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload maybe :call '
(	"123" | maybe(tonumber) == 123
),(	"abc" | maybe(tonumber) == "abc"
)
' :run
