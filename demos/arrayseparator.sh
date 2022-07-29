

. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

input='["a","b","c"]'
expected='["a","_","b","_","c"]'
result="$(
	echo "$input" |
	jq_stack4 -cM :modload arrayseparator :call '
		arrayseparator("_")
	' :run
)"
[ "$result" = "$expected" ] && echo ok || echo KO


input='"aa,b b,cc"'
expected='"(aa),(b b),(cc)"'
result="$(
	echo "$input" |	
	jq_stack4 -cM :modload arrayseparator :call '
		split(",")
		| arrayseparator("),(")
		| "(\(join("")))"
	' :run
)"
[ "$result" = "$expected" ] && echo ok || echo KO
