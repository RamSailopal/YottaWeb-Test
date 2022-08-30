#!/bin/bash

# To run all tests in sequence on localhost, first run 'docker-compose up'
# then run this script.
# The advantage of running on localhost is to get more consistent results
# since you aren't fighting for cpu time as you are on a gitpod.

# make sure there's a directory that user locust can write to store result files
docker compose run --entrypoint '' -u root locust_yottalua bash -c \
  "mkdir -p results/csv && chmod 777 results results/csv"

runtime=30s
targets="yottalua yottago yottarust yottac yottaweb yottamgweb yottapython yottamg_python nodem mgdbx mgphp mgruby"

if [ ! "$@" == "" ]; then
    docker compose run --entrypoint '' locust_yottalua "$@"
else
    for i in $targets; do
        echo
        echo
        echo "~~~ Testing $i"
        port=80
        [ "$i" == "yottamgweb" ] && port=8080
        rm -f locust/results/$i.html locust/results/csv/$i*.csv  # because a new container ID has no permissions to overwrite previous run's files
        docker compose run --entrypoint '' locust_yottalua locust -f locustfile.py --host "http://$i:$port" --headless -u 1000 -r 1000 -s 5 --run-time $runtime --only-summary --html results/$i.html --csv results/csv/$i
        echo "~~~ Written locust/results/$i.html"
    done

    # remove an extra html report line that the original report aggregator doesn't expect (seems to only be added by headless running of locust
    for i in locust/results/*.html; do
        sed "/<link rel=/ d" "$i" -i
    done

    #generate overall stats
    cd locust_reports
        rm `find -name '*.html' ! -name statsmaster.html`
        cp ../locust/results/*.html .
        ./genoverallstat.sh
    cd ..
fi
