. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM --argjson data1 '[
        {"file":"foo", "content":"line1"},
        {"file":"bar", "content":"line1"},
        {"file":"foo", "content":"line2"},
        {"file":"buz", "content":"line1"}
]' --argjson data2 '[
        ["foo", "line1"],
        ["bar", "line1"],
        ["foo", "line2"],
        ["buz", "line1"]
]' :modload keygroup_by :call '
($data1| keygroup_by("file") ) == {"bar":[{"content":"line1"}],"buz":[{"content":"line1"}],"foo":[{"content":"line1"},{"content":"line2"}]},
($data2| keygroup_by(0) ) == {"bar":[["line1"]],"buz":[["line1"]],"foo":[["line1"],["line2"]]}
' :run
