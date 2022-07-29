
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload xl_name_to_col :call '
(
	"A"|xl_name_to_col==0
),(
	"DE"|xl_name_to_col==108
),(
	"AAA"|xl_name_to_col==702
)
' :run
