
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload rpad :call '
(
"1234567890" | rpad(10) == "1234567890"
),(
"1234567890" | rpad(11) == "1234567890 "
),(
"1234567890" | rpad(0) == "1234567890"
)
' :run
