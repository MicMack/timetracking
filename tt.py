#!/usr/bin/python
#Importing network time since the RPis don't have a RTC but can use the NTP
import time

#Importing the abliity to call shell commands
from subprocess import call

#Importing the networking tools
import socket

while 1 :  #always on

    #This is only really useful when a monitor attached, but it makes things pretty when you can see it.
	call(["clear"])

	#setting unit name
	loc = "unit1"

	#Setting time
        CurTime = time.asctime( time.localtime(time.time()) )

    #Paintent Unique ID
	input1 = raw_input("ibarcode: ")

	#checking for exception flags
	if input1 == "1":
		flag = "1"
		puid = raw_input("barcode: ")

	elif input1 == "2":
		flag = "2"
		puid = raw_input("barcode: ")

	#elif input1 == "update":
	#	call(["sh", "/opt/timestudy/rename.sh"])

	else:
		flag = "0"
		puid = input1

        #opening the file
        fo = open("/opt/timestudy/" + loc + ".txt", "a+")

        #writing the data
	fo.write(", " + puid + "," + flag + "," + CurTime + "," + loc + "\n")

        #closing the file
        fo.close()

    #    call(["sh", "/opt/timestudy/rename.sh"])
