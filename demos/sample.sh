. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib-alpha


jq_stack4 -ncM :modload sample :call '
(
	"ok"|sample == "- ok"
),(
	"ok"|sample("*") == "* ok"
)' :run
