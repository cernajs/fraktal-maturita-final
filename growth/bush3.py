from growth.parentClass import plotGrowth

def bush3(a):
	"""vrátí souřadnice pro bush3 fraktál po a iteracích"""
	bush3 = plotGrowth('F', {'F': ' F[+FF][-FF]F[-F][+F]F'}, a, 35)
	x,y = bush3.get_cords()
	return x, y