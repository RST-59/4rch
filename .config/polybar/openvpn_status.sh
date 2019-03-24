#!/bin/bash
#echo "%{A:urxvt -T '__calendar__' -e bash -c '~/.config/polybar/openvpn.sh':}%{F#bf616a}%{A}"
#running=$(pgrep openvpn |& wc -l)
#test $running -eq 3 &&  echo "%{A:urxvt -T '__calendar__' -e bash -c '~/.config/polybar/openvpn.sh':}%{F#60b48a}%{A}"

#!/bin/bash
ip a s dev tun0 &> /dev/null  && echo "%{A:urxvt -T '__calendar__' -e bash -c '~/.config/polybar/openvpn.sh':}%{F#60b48a}%{A}" || echo "%{A:urxvt -T '__calendar__' -e bash -c '~/.config/polybar/openvpn.sh':}%{F#bf616a}%{A}"