
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_deps_hexdump='tohex'
jq_function_hexdump='def hexdump: explode|map(tohex)|join(" ");'
jq_stack4 -ncM :modload hexdump :call '
"hello" | hexdump == "68 65 6c 6c 6f"
' :run
