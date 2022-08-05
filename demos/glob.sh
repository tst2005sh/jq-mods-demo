
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload glob :call '
(
"foo-123-*-bar.txt"|glob("foo-*-\\*-*.txt")
)
' :run
