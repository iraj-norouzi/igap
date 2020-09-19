#!/bin/bash
rand=`od -An -N4 -i < /dev/urandom`
echo "some_metric $rand" | curl --data-binary @- http://admin:admin@172.16.2.20:9091/metrics/job/some_metric
