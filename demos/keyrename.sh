
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload keyrename :call '
(
	{"a":"foo","b":"bar","buz":"buz"} |
	keyrename("a";"foo")|keyrename("b";"bar")
	== {"foo":"foo","bar":"bar","buz":"buz"}
),(

	{"a":"foo","b":"bar","buz":"buz"} |
	keyrename({"a":"foo","b":"bar","c":"ccc"})
	== {"foo":"foo","bar":"bar","buz":"buz"}
),(
	{"foo":"foo","bar":"bar","buz":"buz"} |
	keyrename({"a":"foo","b":"bar","c":"ccc"})
	== {"foo":"foo","bar":"bar","buz":"buz"}
)
' :run

