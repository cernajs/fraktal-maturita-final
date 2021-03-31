from math import pi, sin, cos

class plotLSystem:
    """Hlavní třída pro přeměnu l-systém pravidel na souřadnice"""
    def __init__(self,axiom , rule, iterations, turn_angle):
        self.toRadians = pi / 180
        self.rule = rule
        self.axiom = axiom
        self.iterations = iterations
        self.turn_angle = turn_angle

    def coords(self, rules):
        """
        Dostane pravidlo pro tvorbu l-systému 
        a přetvoří ho na souřadnice, které se dají
        plotnout
        """
        position = (0.0, 0.0, 180.0)
        yield (0.0, 0.0)

        for c in rules:
            x, y, angle = position

            #posune se o přeponu pravoúhlého trojúhelníku
            if c == "F":
                position = (x - cos(angle * self.toRadians),
                     y + sin(angle * self.toRadians),
                     angle)

                yield (position[0], position[1])

            elif c == "+":
                position = (x, y, angle + self.turn_angle)

            elif c == "-":
                position = (x, y, angle - self.turn_angle)

    def transform(self):
        """přemění axiom podle transformařnčního pravidla zadaný počet iterací"""
        for _ in range(self.iterations):
            self.axiom = "".join(self.rule.get(i,i) for i in self.axiom)
        return self.axiom

    def get_cords(self,coords):
        """vrátí souřadnice, které se dají plotnout"""
        x,y = zip(*coords)
        return x,y

