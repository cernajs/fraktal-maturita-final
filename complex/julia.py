import numpy as np

def julia(c=-0.0 + 0.7j, n=1000):
    """vytvoří julia set ze zadaného komplexního čísla"""

    x = np.linspace(-1.5, 1.5, 800).reshape((1, 800))
    y = np.linspace(-1.5, 1.5, 800).reshape((800, 1))
    z = x + 1j * y

    c = np.full(z.shape, c)


    div = np.zeros(z.shape, dtype=int)

    m = np.full(c.shape, True, dtype=bool)

    """
    Provede výpočet podle vzorce
    pokud vyjde, přidá ho do arraye
    """
    for i in range(n):
        z[m] = z[m]**2 + c[m]

        m[np.abs(z) > 2] = False

        div[m] = i
    
    return div


