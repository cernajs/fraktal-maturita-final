from basiclsys.parentClass import plotLSystem

def siepinski(a):
	"""vrátí souřadnice pro siepinski triangle fraktál po a iteracích"""
	siepinski = plotLSystem("FXF--FF--FF", {"F":"FF", "X":"--FXF++FXF++FXF--"}, a, 60)
	x,y = siepinski.get_cords(siepinski.coords(siepinski.transform()))
	return x, y
