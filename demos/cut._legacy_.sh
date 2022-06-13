
#. ./lib/cut.jq.lib.sh

cut='def _cut_fields_range:

if (type!="string") then tostring else . end
| if test("^[0-9]+$") then nth(tonumber)
elif test("^-[0-9]+$") then "ok2"
elif test("^[0-9]+-$") then "ok3"
else error("syntax error")
end
;
def cut_fields($d;$args):
	split($d)|_cut_fields_range
;
'

#echo '"a bc d e f"' | jq "$cut"'cut_fields(" ";["1","3-"])'

#jq -cMn "$cut"' ["0", 1, "2-", "-3"] | map(_cut_fields_range)'
#jq -cMn "$cut"' "a" | _cut_fields_range'


cut_keeprange='def cut_keeprange($a;$b): .[($a|tonumber-1):] | .[:($b|tonumber)-($a|tonumber)+1];
def cut_keeprange($a):
	if ($a|length==2) then
		if $a[0]=="" then	cut_keeprange(1;$a[1])		# "-M" syntax
		elif $a[1]=="" then	cut_keeprange($a[0];-1)		# "N-" syntax
		else			cut_keeprange($a[0];$a[1])	# "N-M" syntax
		end
	else	nth($a[0])
	end
;
'

true || jq -cMn "$cut_keeprange"'
[range(10;0;-1)]
| (
	.,
	cut_keeprange(["","2"]),
	cut_keeprange(["2",""])
)'


jq -n '
1 as $item |
[ [0,0], [2,-1] ] as $r |
if ($r|map( ($item <= .[0]) and ((.[1] < 0) or ($item >= .[1])) )|any) then $item else null end
'


