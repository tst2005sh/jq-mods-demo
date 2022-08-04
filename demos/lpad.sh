
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload lpad :call '
(
"1234567890" | lpad(10) == "1234567890"
),(
"1234567890" | lpad(11) == " 1234567890"
),(
"1234567890" | lpad(0) == "1234567890"
)
' :run
