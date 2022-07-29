
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload xl_col_to_name :call '
(
	0|xl_col_to_name=="A"
),(
	108|xl_col_to_name=="DE"
),(
	702|xl_col_to_name=="AAA"
)
' :run
