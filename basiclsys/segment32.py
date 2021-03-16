from basiclsys.parentClass import *

def segment32(a):
	segment32 = plotLSystem("F+F+F+F", {"F":"-F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F+"}, a, 90)
	x,y = segment32.get_cords(segment32.coords(segment32.transform()))
	return x, y

