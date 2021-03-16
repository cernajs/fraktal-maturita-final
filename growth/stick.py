from growth.parentClass import *

def stick(a):
	stick = plotGrowth('A', {'F': 'FF', 'A': 'F[+AF-[A]--A][---A]'}, a, 22.5)
	x,y = stick.get_cords()
	return x, y