
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

JQ_STACK4_MODDIR=./lib-alpha \
jq_stack4 -n :modload characters_substitution :call '
(
"Hélène et François" | characters_substitution("à=a ç=c é=e è=e ") == "Helene et Francois"
)
' :run
