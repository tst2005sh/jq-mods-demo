
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM -r :modload ansicolor :call '
(	[ {"color": "yellow"}, "foo", {"color": "reset"} ] | ansicolor(true)
),(	[ {"color": "yellow"}, "foo", {"color": "reset"} ] | ansicolor(false)
),(	[ {"color": "yellow"}, "foo", ["_", {"color":null}], {"color": "reset"} ] | ansi_calculate_len
)
' :run

# {"string":"unicode glyph", "length":1}
#echo '{"string":"►", "length":1}' | jq '.string|length'
#echo '{"string":"🦠", "length":1}' | jq '.string|length'
#echo -n '🦠' | hexdump -C
#echo -n '🤣' |hexdump -C

