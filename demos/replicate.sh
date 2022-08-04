

. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload replicate :call '
(
	123 |
	[replicate(3)] == [123,123,123]
),(
	[123,5] |
	.[1] as $n|first|[replicate($n)] == [123,123,123,123,123]
)
' :run
