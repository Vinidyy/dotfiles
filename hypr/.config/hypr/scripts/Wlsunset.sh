LAT=$(curl -s https://ipinfo.io/loc | cut -d',' -f1)
LON=$(curl -s https://ipinfo.io/loc | cut -d',' -f2)

wlsunset -l "$LAT" -L "$LON"
