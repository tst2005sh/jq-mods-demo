. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

echo '[{"is":"A",   "n":1},
{"is":"B",   "n":2},
{"is":"C",   "n":3},
{"is":"END", "n":4},
{"is":"A",   "n":5},
{"is":"B",   "n":6},
{"is":"END", "n":7},
{"is":"A",   "n":8},
{"is":"END", "n":9},
{"is":"END", "n":10}]' |
(
jq_stack4 -cM :modload group_until :call 'group_until(.is=="END")'
jq_stack4 :call '.== [[{"is":"A","n":1},{"is":"B","n":2},{"is":"C","n":3},{"is":"END","n":4}],[{"is":"A","n":5},{"is":"B","n":6},{"is":"END","n":7}],[{"is":"A","n":8},{"is":"END","n":9}],[{"is":"END","n":10}]]'
jq_stack4 :run
)

# group_until(.is=="END")[]
# [{"is":"A","n":1},{"is":"B","n":2},{"is":"C","n":3},{"is":"END","n":4}]
# [{"is":"A","n":5},{"is":"B","n":6},{"is":"END","n":7}]
# [{"is":"A","n":8},{"is":"END","n":9}]
# [{"is":"END","n":10}]
