
# Autorise tout le trafic de loopback (lo0) et supprime tout le trafic vers 127/8 qui n'utilise pas lo0
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT ! -i lo -d 127.0.0.0/8 -j REJECT

# Accepte toutes les connexions entrantes établies
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Autorise tout le trafic sortant
iptables -A OUTPUT -j ACCEPT

# Autorise les connexions HTTP et HTTPS de n'importe où (les ports normaux pour les sites Web)iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Autorise les connexions SSH
iptables -A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT

# Autoriser les pings
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT

# Rejeter tous les autres messages entrants - refus par défaut :
iptables -A INPUT -j REJECT
iptables -A FORWARD -j REJECT

# Pour permettre aux noeuds du LAN avec des adresses IP privées de communiquer avec les réseaux public externes
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Pour rendre le serveur disponible de façon externe 
# Retransmettre des requêtes HTTP à notre système de Serveur HTTP 
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT --to 172.17.0.2:8080


# Pour garder le container actif
while true
do
        sleep 1
done