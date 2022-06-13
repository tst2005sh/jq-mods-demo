. ./lib/jq16sqlbuiltin.jq.lib.sh

data_assets() {
cat<<EOF
{"assetid":1, "aclassid":1, "ainstanceid":5}
{"assetid":2, "aclassid":1, "ainstanceid":5}
{"assetid":3, "aclassid":2, "ainstanceid":3}
{"assetid":4, "aclassid":2, "ainstanceid":1}
EOF
}

data_descriptions() {
cat<<EOF
{"dclassid":1, "dinstanceid": 5, "name":"alpha"}
{"dclassid":2, "dinstanceid": 3, "name":"beta"}
{"dclassid":2, "dinstanceid": 1, "name":"gamma"}
EOF
}

data() {
	{
		data_assets | jq -s .
		data_descriptions | jq -s .
	} |
	jq -s '{"assets":.[0], "descriptions":.[1]}'

}

solution() {
	jq -c "$jq_function_jq16sqlbuiltin"'
		JOIN(	INDEX(.descriptions[]; [.dclassid, .dinstanceid]);
			.assets[];
			[.aclassid, .ainstanceid]|tostring;
			{assetid:(.[0].assetid),name:(.[1].name)}
		)
	'
}
result="$(data|solution)"

expected='{"assetid":1,"name":"alpha"}
{"assetid":2,"name":"alpha"}
{"assetid":3,"name":"beta"}
{"assetid":4,"name":"gamma"}'

[ "$result" = "$expected" ] && echo ok || echo ko
exit
