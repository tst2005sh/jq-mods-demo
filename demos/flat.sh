
. ./deps/jq-helpers/lib/jq_stack4.lib.sh
JQ_STACK4_MODDIR=./lib

echo '
{"id":1,"foo":"foo",                "custom_fields":{"x":"x1","foo":"FOO1"}}
{"id":2,"foo":"foo2", "bar":"bar2" ,"custom_fields":{"x":"x2","foo":"FOO2"}}
{"id":3,"foo":"foo3", "bar":"bar3" ,"custom_fields":null}
{"id":4,"foo":"foo4", "bar":"bar4"}
' |
jq_stack4 -cM :modload flat :call '
flat(if first=="custom_fields" then "CF_\(.[1])" elif length==1 then first else join("/") end)
' :run

echo '
{
  "YYYY-MM": {
    "A": {
      "FAILURE": {
        "count": 12,
        "expected_total_of_success_and_failure": 8928
      },
      "SUCCESS": {
        "count": 123,
        "expected_total_of_success_and_failure": 8928
      }
    },
    "B": {
      "FAILURE": {
        "count": 456,
        "expected_total_of_success_and_failure": 8928
      },
      "SUCCESS": {
        "count": 78,
        "expected_total_of_success_and_failure": 8928
      }
    },
    "C": {
      "FAILURE": {
        "count": 333,
        "expected_total_of_success_and_failure": 44640
      },
      "SUCCESS": {
        "count": 444,
        "expected_total_of_success_and_failure": 44640
      }
    },
    "D": {
      "FAILURE": {
        "count": 23,
        "expected_total_of_success_and_failure": 44640
      },
      "SUCCESS": {
        "count": 1023,
        "expected_total_of_success_and_failure": 44640
      }
    },
    "E": {
      "FAILURE": {
        "count": 757,
        "expected_total_of_success_and_failure": 44640
      },
      "SUCCESS": {
        "count": 987,
        "expected_total_of_success_and_failure": 44640
      }
    },
    "F": {
      "FAILURE": {
        "count": 700,
        "expected_total_of_success_and_failure": 44640
      },
      "SUCCESS": {
        "count": 300,
        "expected_total_of_success_and_failure": 44640
      }
    }
  }
}
' |
jq_stack4 -cM :modload flat :call '
flat(join("/"))
' :run
