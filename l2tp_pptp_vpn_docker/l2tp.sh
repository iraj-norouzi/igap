#!/bin/bash
docker run     --name l2tp-ipsec-vpn-server     --env-file /home/vpnn.env     -p 500:500/udp     -p 4500:4500/udp     -v /lib/modules:/lib/modules:ro     -d --privileged     fcojean/l2tp-ipsec-vpn-serverb
