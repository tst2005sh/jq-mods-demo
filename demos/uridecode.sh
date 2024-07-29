
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib
jq_stack4 -ncM :modload uridecode :call '
	"https%3A%2F%2Fgithub.com%2Ftst2005sh%2Fjq-mods-demo%3F%23%25" |
	uridecode == "https://github.com/tst2005sh/jq-mods-demo?#%"
' :run
