
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

result="$(
	echo '[["BUZ","BAR","FOO"],["zzz1","bar1","foo1"],[null,"bar2","foo2"]]' |
	jq_stack4 -cM :modcall array_to_object :run
)"
expected='[{"BUZ":"zzz1","BAR":"bar1","FOO":"foo1"},{"BUZ":null,"BAR":"bar2","FOO":"foo2"}]'
[ "$result" = "$expected" ] && echo ok || echo ko
