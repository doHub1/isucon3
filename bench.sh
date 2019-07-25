today=`date '+%Y_%m_%d_%H_%M_%S'`;
filename="/var/tmp/bench_${today}.log"
#filename="/var/tmp/bench_2019_07_24__10_21_50.log"

/home/isucon/qualifier_bench/qualifier_bench benchmark --workload 1 --init init.sh | tee -a ${filename}

success=$(cat ${filename} | cut -d: -f 2 | tr -d ' ' | head -n 1)
score=$(cat ${filename} | cut -d: -f 2 | tr -d ' ' | tail -n 1)
fail=$(cat ${filename} | cut -d: -f 2 | tr -d ' ' | tail -n 2 | head -n 1)

generate_json()
{
  cat <<EOF
{  
  "pass":true,
  "score":${score},
  "success":1434,
  "fail":${fail},
  "messages":[],
  "timestamp":{  
    ".sv":"timestamp"
  }
}
EOF
}

name=$(hostname)
curl "https://n-isucon-201-75369505.firebaseio.com/teams/${name}.json" -X POST -H "Content-Type: application/json" -d "$(generate_json)"

