. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload keyselect :call '(
	[{"x":"x"},{"y":"y"}]			| keyselect(.=="y")		| .==[{"y":"y"}]
),(
	[{"x":"x"},{"y":"y"},{"foo":"foo"}]	| keyselect(test("^[yxz]$"))	| .==[{"x":"x"},{"y":"y"}]
),(
	{"x":"x","y":"y"}			| keyselect(.=="y")		|.== {"y":"y"}
),(
	{"x":"x","y":"y","foo":"foo"}		| keyselect(test("^[yxz]$"))	| .=={"x":"x","y":"y"}
)' :run 
