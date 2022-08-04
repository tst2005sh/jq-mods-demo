. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

jq_stack4 -ncM :modload with_kv :call '
(

{}				|to_kv | .== []				),(
{"a":"A"}			|to_kv | .== [{key:"a",value:"A"}]	),(
["foo"]				|to_kv | .== [{key:0, value:"foo"}]	),(

[]				|from_kv("object") == {}		),(
[]				|from_kv("array") == []			),(
[{key:"a",value:"A"}]		|from_kv("object") == {"a":"A"}		),(
[{key:0, value:"foo"}]		|from_kv("array") == ["foo"]		),(
#[{key:0, value:"foo"}]		|from_kv("object") == {"0":"foo"}	),(

{}				|with_kv(.) == {}			),(
{"a":"A"}			|with_kv(.) == {"a":"A"}		),(
["a"]				|with_kv(.) == ["a"]			),(
[]				|with_kv(.) == []

)' :run 
