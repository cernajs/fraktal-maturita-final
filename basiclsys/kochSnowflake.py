from basiclsys.parentClass import plotLSystem

def koch(a):
	"""vrátí souřadnice pro koch snowflake fraktál po a iteracích"""
	koch = plotLSystem("F--F--F", {"F":"F+F--F+F"}, a, 60)
	x,y = koch.get_cords(koch.coords(koch.transform()))
	return x, y
