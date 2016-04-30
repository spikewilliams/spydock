#!/bin/bash
docker run -d=true -v=`pwd`/tests:/tests spikewilliams/spydock /run_unit_tests 

