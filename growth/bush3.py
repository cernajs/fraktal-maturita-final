from growth.parentClass import *

def bush3(a):
	bush3 = plotGrowth('F', {'F': ' F[+FF][-FF]F[-F][+F]F'}, a, 35)
	x,y = bush3.get_cords()
	return x, y