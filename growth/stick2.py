from growth.parentClass import *

def stick2(a):
	stick2 = plotGrowth('X', {"F":"FF",'X': 'F[+X]F[-X]+X'}, a, 20)
	x,y = stick2.get_cords()
	return x, y