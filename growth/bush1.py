from growth.parentClass import *

def bush1(a):
	bush1 = plotGrowth('F', {'F': 'FF[++F][-FF]'}, a, 22)
	x,y = bush1.get_cords()
	return x, y