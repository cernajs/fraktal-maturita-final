import numpy as np

#
#
#
#MANDELBROT

def get_iteration(c, thresh =4, max_steps =25):
    """zjistíme, jestli číslo z množiny diverguje"""
    z=c
    i=1
    while i<max_steps and (z*z.conjugate()).real<thresh:
        z=z*z +c
        i+=1
    return i


def mand(n, thresh=4, max_steps=25):
    """vrátí mandelbrotovu množinu"""
    mx = 2.48 / (n-1)
    my = 2.26 / (n-1)
    """
    přemění souřadnice na reálné,
    hranice jsou určeny podle maximálních hodnot mandelbrotovy množiny
    """
    mapp = lambda x,y: (mx*x - 2, my*y - 1.13) 
    img=np.full((n,n), 255) #array n*} pixelů pro ukládání hodnot
    for x in range(n):
        for y in range(n):
            it = get_iteration(complex(*mapp(x,y)), thresh=thresh, max_steps=max_steps) 
            #zjistíme jestli bod do množiny patří, podle toho ho tam přidáme
            img[y][x] = 255 - it
    return img


#
#
#
#
