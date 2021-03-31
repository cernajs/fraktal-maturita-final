from basiclsys.parentClass import plotLSystem

def segment32(a):
	"""vrátí souřadnice pro segment32 curve fraktál po a iteracích"""
	segment32 = plotLSystem("F+F+F+F",
	 {"F":"-F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F+"},
	  a, 90)
	x,y = segment32.get_cords(segment32.coords(segment32.transform()))
	return x, y

