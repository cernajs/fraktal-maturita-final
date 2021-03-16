from basiclsys.parentClass import *

def dragon(a):
	dragon = plotLSystem("FX", {'X': 'X+YF+','Y': '-FX-Y'}, a, 90)
	x,y = dragon.get_cords(dragon.coords(dragon.transform()))
	return x, y
