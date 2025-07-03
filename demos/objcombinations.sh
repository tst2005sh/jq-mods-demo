
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

echo '
{"domain": ["ip", "ip6"], "": [
    {"table": "filter", "": [
        {"chain":"INPUT", "": [
            {"@if": {"@eq": {"domain": "ip"}}, "@then": [
              {"proto": ["esp", "ah"], "jump": "ACCEPT"}
            ], "@else": [
              {"proto": ["esp"], "jump": "ACCEPT"}
            ]}
        ]}
    ]}
]}
' |
jq_stack4 -cM :modload objcombinations :call '
("objcombinations:",
objcombinations
),(
"objcombinations(...):",
objcombinations(.key|test("^@")|not)
)
' :run

echo '
{"domain": ["ip", "ip6"], "": [
    {"table": "filter", "": [
        {"chain":"INPUT", "": [
            {"policy": "DROP"},

            # connection tracking
            {"mod": "state", "state": "INVALID", "jump": "DROP"},
            {"mod": "state", "state": ["ESTABLISHED", "RELATED"], "jump": "ACCEPT"},
            
            # allow local packet
            {"interface": "lo", "jump": "ACCEPT"},
            
            # respond to ping
            {"proto":"icmp", "jump": "ACCEPT"},
            
            # allow SSH connections
            {"proto": "tcp", "dport": "ssh", "jump": "ACCEPT"}
        ]},
        {"chain": "OUTPUT", "": [
            {"policy": "ACCEPT"},
            
            # connection tracking
            #{"mod": "state", "state": "INVALID", "jump": "DROP"},
            {"mod": "state", "state": ["ESTABLISHED", "RELATED"], "jump": "ACCEPT"}
        ]},
        {"chain": "FORWARD", "": [
            {"policy": "DROP"}
        ]}
    ]}
]}
' |
grep -v '^[[:space:]]*#' |
grep -v '^$' |
jq_stack4 -cM :modload objcombinations :call 'objcombinations' :run

