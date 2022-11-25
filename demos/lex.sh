
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload lex :call '
(
	"def x: 123;" | lex
	== [{"ident":"def"},{"ident":"x"},{"colon":":"},{"number":"123"},{"semicolon":";"}]
)
' :run
