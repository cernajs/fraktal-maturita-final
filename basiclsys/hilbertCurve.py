from basiclsys.parentClass import plotLSystem

def hilbert(a):
	"""vrátí souřadnice pro hilbert curve fraktál po a iteracích"""
	koch = plotLSystem("L", {"L":"+RF-LFL-FR+", "R":"-LF+RFR+FL-"}, a, 90)
	x,y = koch.get_cords(koch.coords(koch.transform()))
	return x, y