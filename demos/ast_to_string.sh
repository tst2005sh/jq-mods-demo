
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload lex :modload parse :modload ast_to_string :call '
(	"123" | lex | parse | ast_to_string == "123"
),(	"\"a string\"" | lex | parse | ast_to_string == "\"a string\""
),(	"simple_call_name" | lex | parse | ast_to_string == "simple_call_name"
),(	"call_name_1arg(123)" | lex | parse | ast_to_string == "call_name_1arg(123)"
),(	"call_name_2arg(11;22)" | lex | parse | ast_to_string == "call_name_2arg(11;22)"
),(	"a(11;b(111;222);33)" | lex | parse | ast_to_string == "a(11;b(111;222);33)"
),(	"def x: 123; x" | lex | parse | ast_to_string == "def x:123;x"
),(	"def x($a;$b): 123; x" | lex | parse | ast_to_string == "def x($a;$b):123;x"
),(	"($a+123)" | lex | parse | ast_to_string == "($a+123)"
),(	"x($a+123)" | lex | parse | ast_to_string == "x($a+123)"
),(	"x($a+123;22)" | lex | parse | ast_to_string == "x($a+123;22)"
),(	"x($a+123;22),y" | lex | parse | ast_to_string == "x($a+123;22),y"
),(	"def x: 123;x" | lex|parse|ast_to_string == "def x:123;x"
),(	"if .==0 then 11 else 99 end" | lex|parse|ast_to_string == "if .==0 then 11 else 99 end"
),(	"if .==0 then 11 elif .==2 then 22 elif .==3 then 33 else 99 end" | lex|parse|ast_to_string
==	"if .==0 then 11 elif .==2 then 22 elif .==3 then 33 else 99 end"
)
' :run
exit
for f in lib/jq/*.jq; do
	jq_stack4 -ncM :modload lex :modload parse :modload ast_to_string --arg f "$(cat "$f")" :call '$f | lex | parse | ast_to_string' :run
	break
done
