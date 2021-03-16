from growth.parentClass import *

def bush2(a):
	bush2 = plotGrowth('Y', {'X': ' X[-FFF][+FFF]FX', 'Y': ' YFX[+Y][-Y]'}, a, 25.7)
	x,y = bush2.get_cords()
	return x, y