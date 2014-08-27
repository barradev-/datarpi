#!/bin/bash

post="
rs[sn]=SRVSIAFA-&
rs[ts]=2014/08/26 14:15:50&
rs[lat]=S 34 38.8492&
rs[lon]=W 058 29.8964&
rs[si1]=Temp&
rs[sv1]=206.5&
rs[si2]=Hum&
rs[sv2]=41&
rs[si3]=Bat&
rs[sv3]=181&
rs[si4]=CO&
rs[sv4]=0.77&
rs[si5]=SO2&
rs[sv5]=0.16&
rs[si6]=VOCs&
rs[sv6]=0.029&
rs[obs]= desde laboratorio"

wget -S -O - http://telex.barradev.com.ar/aqm/reg_sesion/create \
     --post-data="$(echo "$post" | tr -d "\n")" \
