from growth.parentClass import plotGrowth

def stick(a):
	"""vrátí souřadnice pro stick fraktál po a iteracích"""
	stick = plotGrowth('A', {'F': 'FF', 'A': 'F[+AF-[A]--A][---A]'}, a, 22.5)
	x,y = stick.get_cords()
	return x, y