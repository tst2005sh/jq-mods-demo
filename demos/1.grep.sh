
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

#[ $# -gt 0 ] || set -- '"foo"'

echo '[
"foo",
"bar",
"foobar"
]' |

#jq_stack4 -cM :modload grep :call 'igrep('"$1"')' :run
jq_stack4 -cM :modload grep :call '
igrep("foo") == ["foo","foobar"]
' :run 
