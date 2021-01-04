source /ts/install/profile
sleep 1
chmod +x /ts/proc/*
chmod +x /ts/proc/script/*
chmod +x /ts/script/*
#adduser mosquitto
/ts/script/gprs-on.sh
sleep 3
sh /ts/script/ts-dial.sh &
sleep 3
sh /ts/script/sysset.sh
sleep 1
/ts/proc/mosquitto &
sleep 1 
/ts/proc/sql &
sleep 1
/ts/proc/sys  &
/ts/proc/modbus_client  &
/ts/proc/output_http  &
