from growth.parentClass import plotGrowth

def bush1(a):
	"""vrátí souřadnice pro bush1 fraktál po a iteracích"""
	bush1 = plotGrowth('F', {'F': 'FF[++F][-FF]'}, a, 22)
	x,y = bush1.get_cords()
	return x, y