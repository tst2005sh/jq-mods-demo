. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload unsorted_group_by :call '
{"input":[
{"id":1,"type":"x"},
{"id":2,"type":"y"},
{"id":3,"type":"x"},
{"id":4,"type":"x"},
{"id":5,"type":"y"},
{"id":6,"type":"y"}
],
"wanted":[
[{"id":1,"type":"x"}],
[{"id":2,"type":"y"}],
[{"id":3,"type":"x"},{"id":4,"type":"x"}],
[{"id":5,"type":"y"},{"id":6,"type":"y"}]
]
}|
(
	(.input|unsorted_group_by(.type))==.wanted
)' :run
