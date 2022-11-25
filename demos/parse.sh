
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload lex :modload parse :call '
(
	"def x: 123;" | lex | parse
	== {"term":{"type":"TermTypeIdentity"},"func_defs":[{"name":"x","body":{"term":{"number":"123","type":"TermTypeNumber"}}}]}
)
' :run
