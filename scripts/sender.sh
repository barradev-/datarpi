#!/bin/bash

echo 'Socat: Serial Port Emulator - user and group required'
echo -n 'user: '
read user
echo -n 'group: '
read group
socat -d -d PTY,link=/dev/ttyS10,raw,echo=0,crnl,user=$user,group=$group PTY,link=/dev/ttyS11,raw,echo=0,crnl,user=$user,group=$group &



while [ 1 ]; do
  sleep 10s

sen=$RANDOM
RANGE=29

timestamp=`date`

let "sen %= $RANGE"


echo "
-I- Finaliza el 02/01 a las 12:00hs aprox.
-I- Hay una sesion de muestreo en curso, no puede acceder a esta funcion ahora.
rs[sn]=AQM120817&rs[ts]=$timestamp&rs[lat]=N 89 60.0000&rs[lon]=E 000 00.0000&rs[si1]=Temp&rs[sv1]=$sen.0000&rs[si2]=Hum&rs[sv2]=63.0000&rs[si3]=CO&rs[sv3]=$sen.0000&rs[si4]=SO2&rs[sv4]=$sen.0000&rs[si5]=VOCs&rs[sv5]=$sen.0000&rs[obs]=Generado en laboratorio el dia $timestamp&rs[si6]=Power&rs[sv6]=I/O&rs[si7]=Bat&rs[sv7]=63.0000
-I- Enviando Cmd de 51 char: $PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29
-I- Modulo GPS reseteado.
-I- Ventiladores encendidos." | tee /dev/ttyS10


done
