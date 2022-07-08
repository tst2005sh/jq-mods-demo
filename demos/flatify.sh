
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

echo '
{"id":1,"foo":"foo",                "custom_fields":{"x":"x1","foo":"FOO1"}}
{"id":2,"foo":"foo2", "bar":"bar2" ,"custom_fields":{"x":"x2","foo":"FOO2"}}
{"id":3,"foo":"foo3", "bar":"bar3" ,"custom_fields":null}
{"id":4,"foo":"foo4", "bar":"bar4"}
' |
jq_stack4 -cM :modload flatify :call '
flatify(.custom_fields;"CF_\(.)")
' :run
