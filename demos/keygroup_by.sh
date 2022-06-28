. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_function_keygroup_by='def keygroup_by($field): group_by(.[$field]) | map({"key": (first|.[$field]|tostring), "value": (map(del(.[$field]))) }) |from_entries;'

jq_stack4 -ncM :modload keygroup_by


jq_stack4 --argjson data1 '[
	{"file":"foo", "content":"line1"},
	{"file":"bar", "content":"line1"},
	{"file":"foo", "content":"line2"},
	{"file":"buz", "content":"line1"}
]'
jq_stack4 --argjson data2 '[
	["foo", "line1"],
	["bar", "line1"],
	["foo", "line2"],
	["buz", "line1"]
]'
jq_stack4 --argjson data3 '[
	{"id":1, "content":"line1"},
	{"id":2, "content":"line1"},
	{"id":1, "content":"line2"},
	{"id":9, "content":"line1"}
]'

jq_stack4 :call '(
	$data1| keygroup_by("file") == {"bar":[{"content":"line1"}],"buz":[{"content":"line1"}],"foo":[{"content":"line1"},{"content":"line2"}]}
),(
	$data2| keygroup_by(0) == {"bar":[["line1"]],"buz":[["line1"]],"foo":[["line1"],["line2"]]}
),(
	$data3 | keygroup_by("id") == {"1":[{"content":"line1"},{"content":"line2"}],"2":[{"content":"line1"}],"9":[{"content":"line1"}]}
)

' :run
