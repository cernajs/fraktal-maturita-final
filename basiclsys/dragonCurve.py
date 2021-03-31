from basiclsys.parentClass import plotLSystem

def dragon(a):
	"""vrátí souřadnice pro dragon curve fraktál po a iteracích"""
	dragon = plotLSystem("FX", {'X': 'X+YF+','Y': '-FX-Y'}, a, 90)
	x,y = dragon.get_cords(dragon.coords(dragon.transform()))
	return x, y
