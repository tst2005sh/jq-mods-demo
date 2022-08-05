
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncMr :modload color :call '
["a ", ("green"|color),"green text",("reset"|color)," and no color text"]
' :modcall ansicolor :run
