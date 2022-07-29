
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload unsorted_unique_by :call '
(
	[ "c", "z", "c", "a"] |
	unsorted_unique_by(.)
 	== ["c","z","a"]
),(
	[ {"o":"c","x":1}, {"o":"z"}, {"o":"c","x":2}, {"o":"a"} ] |
	unsorted_unique_by(.o)
	==[{"o":"c","x":1},{"o":"z"},{"o":"a"}]
)
' :run
