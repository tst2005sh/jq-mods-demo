

. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -cM :modload round :call '
(
	[.[0],(.[0]|round)==.[1],(.[0]*100|round/100)==.[2]]
)
'

echo '
[123.4461,123,123.45]
[-123.4461,-123,-123.45]
[1.4,1,1.40]
[1.5,2,1.50]
[1.6,2,1.60]
[-1.6,-2,-1.60]
[-1.5,-2,-1.50]
[-1.4,-1,-1.40]
' |
jq_stack4 :run
