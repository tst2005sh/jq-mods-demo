
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

#         [["X","XX","XXX","XXXX"],["a'a","b\"b","\"c'c\"","\"d\"d\""]]
expected='[["X","XX","XXX","XXXX"],["a'\''a","b\"b","\"c'\''c\"","\"d\"d\""]]'

result="$(
	cat data-samples/sample1a.tsv |
	jq_stack4 -RcMr :modload fromtsv :call '[.,inputs]|fromtsv' :run

)"
[ "$result" = "$expected" ] && echo ok || echo ko

result="$(
	cat data-samples/sample1b.tsv |
	jq_stack4 -RcMr :modload fromtsv :call '[.,inputs]|fromtsv' :run
)"
[ "$result" = "$expected" ] && echo ok || echo ko

result="$(
	printf 'foo\tbar\n"x\\ny"\tBAR\n' |
	jq_stack4 -RcMr :modload fromtsv :call '
		[.,inputs]|fromtsv == [["foo","bar"],["x\ny","BAR"]]
	' :run
)"
expected='true'
[ "$result" = "$expected" ] && echo ok || echo ko
