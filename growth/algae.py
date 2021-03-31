from growth.parentClass import plotGrowth

def algae(a):
	"""vrátí souřadnice pro algae fraktál po a iteracích"""
	algae = plotGrowth('aF',
 {"a":"FFFFFy[++++n][----t]fb",
 'b': '+FFFFFy[++++n][----t]fc',
 "c":"FFFFFy[++++n][----t]fd",
 "d":"-FFFFFy[++++n][----t]fe",
 "e":"FFFFFy[++++n][----t]fg",
 "g":"FFFFFy[+++fa]fh",
 "h":"FFFFFy[++++n][----t]fi",
 "i":"+FFFFFy[++++n][----t]fj",
 "j":"FFFFFy[++++n][----t]fk",
 "k":"FFFFFy[++++n][----t]fl",
 "l":"FFFFFy[++++n][----t]fm",
 "m":"FFFFFy[---fa]fa",
 "n":"ofFFF",
 "o":"fFFFp",
 "p":"fFFF[-s]q",
 "q":"fFFF[-s]r",
 "r":"fFFF[-s]",
 "s":"fFfF",
 "t":"ufFFF",
 "u":"fFFFv",
 "v":"fFFF[+s]w",
 "w":"fFFF[+s]x",
 "x":"fFFF[+s]",
 "y":"Fy",},
  a, 12)
	x,y = algae.get_cords()
	return x, y