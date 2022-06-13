. ./lib/pow.jq.lib.sh
#. ./lib/with_precision.jq.lib.sh
. ./lib/round.jq.lib.sh

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
jq -c "$jq_function_pow""$jq_function_round""$jq_function_round_precision"'
#	[.[0],(.[0]|round)==.[1],(.[0]*100|round/100)==.[2],(.[0]|with_precision(round;1000))]
	[
		.[0],
		(.[0]|round(2))==.[2]
	]
'
