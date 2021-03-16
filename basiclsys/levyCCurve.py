from basiclsys.parentClass import *

def levy(a):
	levy = plotLSystem("F", {"F":"+F--F+"}, a, 45)
	x,y = levy.get_cords(levy.coords(levy.transform()))
	return x, y

