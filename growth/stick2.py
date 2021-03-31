from growth.parentClass import plotGrowth

def stick2(a):
	"""vrátí souřadnice pro stick2 fraktál po a iteracích"""
	stick2 = plotGrowth('X', {"F":"FF",'X': 'F[+X]F[-X]+X'}, a, 20)
	x,y = stick2.get_cords()
	return x, y