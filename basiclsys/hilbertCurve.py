from basiclsys.parentClass import *

def hilbert(a):
	koch = plotLSystem("L", {"L":"+RF-LFL-FR+", "R":"-LF+RFR+FL-"}, a, 90)
	x,y = koch.get_cords(koch.coords(koch.transform()))
	return x, y