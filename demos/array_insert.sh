. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload array_insert :call '
[range(4)]|
(
	array_insert(2;"before2")|
	array_insert(0;"before0")|
	array_insert(-1;"beforeend") == ["before0",0,1,"before2",2,"beforeend",3]
)' :run 
