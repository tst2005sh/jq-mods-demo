
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload ceil :call '
([2,124,988,1,0,-1,-1,-123]) as $ceil_expected|
[
1.199,
123.456,
987.654,
0.1,
-0.1,
-1.1,
-1.9,
-123.456
]|
to_entries|map( .floor=(.value|floor)| .ceil=(.value|ceil) )|
map( .ceilpass = (.ceil == $ceil_expected[.key]) )[]
' :run

