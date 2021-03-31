from growth.parentClass import plotGrowth

def bush2(a):
	"""vrátí souřadnice pro bush2 fraktál po a iteracích"""
	bush2 = plotGrowth('Y', {'X': ' X[-FFF][+FFF]FX', 'Y': ' YFX[+Y][-Y]'}, a, 25.7)
	x,y = bush2.get_cords()
	return x, y