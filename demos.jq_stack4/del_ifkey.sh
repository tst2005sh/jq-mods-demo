. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload del_ifkey :modload recursive_del_ifkey :call '
(
	{"a":"A","b_count":1,"c_count":2,"b":"B"}
	|del_ifkey(endswith("_count"))
	| .=={"a":"A","b":"B"}
),(
	{"a":"A","b_count":1,"c_count":2,"sb":"sB","sub2":{"subsub2":{"z":"Z","url":"URL"}},"b":"B"}
	| del_ifkey(endswith("_count"))
	| .=={"a":"A","sb":"sB","sub2":{"subsub2":{"z":"Z","url":"URL"}},"b":"B"}
),(
	{"a":"A","sub1":{"b_count":1,"c_count":2,"sb":"sB","id":123},"sub2":{"subsub2":{"z":"Z","url":"URL"}},"b":"B","id":456}
	| recursive_del_ifkey(endswith("_count") or test("^(url|id)$"))
	| .=={"a":"A","sub1":{"sb":"sB"},"sub2":{"subsub2":{"z":"Z"}},"b":"B"}
)' :run
