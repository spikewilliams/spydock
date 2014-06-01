#!/bin/bash
docker run -d=true -v=`pwd`/tests:/tests spydock/base /run_unit_tests 

