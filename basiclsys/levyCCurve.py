from basiclsys.parentClass import plotLSystem

def levy(a):
	"""vrátí souřadnice pro levyCCurve fraktál po a iteracích"""
	levy = plotLSystem("F", {"F":"+F--F+"}, a, 45)
	x,y = levy.get_cords(levy.coords(levy.transform()))
	return x, y

