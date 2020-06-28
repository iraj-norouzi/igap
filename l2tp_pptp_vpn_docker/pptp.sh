#!/bin/bash
docker run -d --privileged --restart=always --network=host  -v /home/chap-secrets:/etc/ppp/chap-secrets mobtitude/vpn-pptp
