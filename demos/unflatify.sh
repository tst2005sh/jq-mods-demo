
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -cM :modload unflatify -n :call '
(
{"id":1,"foo":"foo",                "CF_x":"x1","CF_foo":"FOO1"} | unflatify(.custom_fields;"^CF_(.*)") == {"id":1,"foo":"foo","custom_fields":{"x":"x1","foo":"FOO1"}}
),(
{"id":2,"foo":"foo2", "bar":"bar2", "CF_x":"x2","CF_foo":"FOO2"} | unflatify(.custom_fields;"^CF_(.*)") == {"id":2,"foo":"foo2","bar":"bar2","custom_fields":{"x":"x2","foo":"FOO2"}}
),(
{"id":4,"foo":"foo4", "bar":"bar4"}				 | unflatify(.custom_fields;"^CF_(.*)") == {"id":4,"foo":"foo4","bar":"bar4"}
)
' :run
