from basiclsys.parentClass import *

def koch(a):
	koch = plotLSystem("F--F--F", {"F":"F+F--F+F"}, a, 60)
	x,y = koch.get_cords(koch.coords(koch.transform()))
	return x, y