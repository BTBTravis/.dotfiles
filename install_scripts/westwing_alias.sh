#!/usr/bin/env bash

#Source Paths
readonly username="t.shears"
readonly dockerSorucePath="/Users/$username/projects/club/"

#General
alias ww-alice="cd ${dockerSorucePath}/sources"
alias ab="${dockerSorucePath}bin/ab $1"
alias ww-rmcache="ab tools/ww-rmcache";
alias ww-conf="ab tools/ww-conf";

#Unit test
alias ww-alice-test="runAliceTest"
alias ww-bob-test="runBobTest"

# MySQL
alias mysql-nuts-stage='mysql -h stagedb1.wwdus.local -u st_bob_nuts1 -p stage_bob_nuts1'
alias mysql-de-stage='mysql -h stagedb3.wwdus.local -u st_bob_de -p stage_bob_de'

#WORKER AND SCHEMA
alias runWorker='ab php /application/alice/alice/worker/Worker.php'
alias runPartialWorker="ab php /application/alice/alice/worker/Worker.php partial"
alias runTestWorker='ab php /application/alice/alice/worker/Worker.php automatedtests'
alias runAll='runAll';

runAll() {
    ab tools/ww_albo schema &&
    ab tools/ww_albo dbtable &&
    ab tools/ww_albo transfer &&
    ab tools/ww_albo worker &&
    ab tools/ww-rmcache
}


exportEnv() {
    if [ $( docker-machine status club | grep -i "running" | wc -l ) != "0" ]
    then
        eval $(docker-machine env club)
    fi
}

runAliceTest()
{
    unitTest="ab vendor/bin/phpunit --bootstrap alice/alice/protected/tests/bootstrap.php -c alice/alice/protected/tests/phpunit.xml"
    filePath="alice/alice/protected/tests/unit/"
    if [ $# -eq 1 ]; then
        filePath=$1
    fi

    echo
    echo "---- Running Test -----" $filePath
    echo

    eval $unitTest $filePath
}

runBobTest()
{
    unitTest="ab vendor/bin/phpunit --bootstrap bob/tests/bootstrap.php -c bob/tests/unit/minimal.xml"
    filePath="bob/tests/unit/"
    if [ $# -eq 1 ]; then
        filePath=$1
    fi

    echo
    echo "---- Running Test -----" $filePath
    echo
    eval $unitTest $filePath
}

#call the export method
exportEnv