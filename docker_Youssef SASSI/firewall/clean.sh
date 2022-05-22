#!/bin/bash

yes | apt update
yes | apt-get install iptables

# On affiche nos chaines initiales

iptables -L

# On efface les configurations dans les chaines INPUT, OUTPUT, FORWARD
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

# On définit les polices INPUT, OUTPUT, FORWARD en ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT


# On affiche nos chaines finales
iptables -L