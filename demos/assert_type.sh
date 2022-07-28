
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload assert_type :call '
def test1:	["ok"]|assert_type(["array","number"])		| (.==["ok"]);
def test2:	{"ok"}|assert_type("object")			| (.=={"ok"});
test1,test2
' :run
