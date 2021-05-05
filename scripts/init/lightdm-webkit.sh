#!/bin/bash/

GREETER=lightdm-webkit2-greeter
LIGHTDM=/etc/lightdm/lightdm.conf
TEST="test.lightdm-webkit2"

sed -i 's,greeter-session.*,greeter-session='"$GREETER"',' "$TEST" # Change login greeter 
sed -i -e '/^\[VNCServer\]/,+7 d' "$TEST"

echo '
[VNCServer]
enabled=false
command=Xvnc
port=5900
#listen-address=
width=1920
height=1080
depth=8
' | sudo tee -a $TEST > /dev/null
