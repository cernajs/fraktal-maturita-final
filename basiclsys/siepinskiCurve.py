from basiclsys.parentClass import *

def siepinski(a):
	siepinski = plotLSystem("FXF--FF--FF", {"F":"FF", "X":"--FXF++FXF++FXF--"}, a, 60)
	x,y = siepinski.get_cords(siepinski.coords(siepinski.transform()))
	return x, y

#plot_coords(turtle_to_coords(transform_multiple('FXF--FF--FF',
#{"F":"FF", "X":"--FXF++FXF++FXF--"}, 15),90))   #16