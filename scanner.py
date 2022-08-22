#!bin/python

import sys
import socket
from datetime import datetime


# Checking the Length of argument list to check whether ip is present.
if (len(sys.argv) == 2):
	target = socket.gethostbyname(sys.argv[1])
else:
	print("You forgot to mention IP")

print('-' * 50)
print("Scanning IP: " + target)
print("Starting at: " + str(datetime.now()))
print('-' * 50)

ip = sys.argv[1].split(".")
#print(ip)
for i in ip:
	if int(i) > 255:
		print("Invalid IP, Terminating...\n");
		sys.exit()

try:
	for port in range(1,65535):
		s = socket.socket(socket.AF_INET , socket.SOCK_STREAM)
		socket.setdefaulttimeout(1)
		result = s.connect_ex((target,port))
		#print("Checking Port {}: ".format(port))
		if result == 0:
			print("Port {} is open.".format(port))
		s.close()

except KeyboardInterrupt:
	print("\n Exiting Program")
	sys.exit()

except sys.gaierror:
	print("Hostname could not be resolved\n")
	sys.exit()

except socket.error:
	print("Couldn't connect to the server\n")
	sys.exit()

