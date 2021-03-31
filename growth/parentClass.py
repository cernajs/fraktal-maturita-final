from math import pi, sin, cos

class plotGrowth:
    """Hlavní třída pro přeměnu l-systém pravidel na souřadnice"""
    def __init__(self, axiom , rule, iterations, turn_angle):
        self.toRadians = pi / 180
        self.rule = rule
        self.axiom = axiom
        self.iterations = iterations
        self.turn_angle = turn_angle

    def coords(self,rule):
        """
        Dostane pravidlo pro tvorbu l-systému,
        který se větví a přetvoří ho na souřadnice,
        které se dají plotnout
        """
        saved_states = list()
        state = (0, 0, 90)
        yield (0, 0)

        for command in rule:
            x, y, angle = state

            #posune se o přeponu pravoúhlého trojúhelníku
            if command.lower() in 'abcdefghij':       
                state = (x - cos(angle * self.toRadians),
                         y + sin(angle * self.toRadians),
                         angle)
                
                if command.islower():                  
                    yield (float('nan'), float('nan'))

                yield (state[0], state[1])

            elif command == '+':                       
                state = (x, y, angle + self.turn_angle)

            elif command == '-':                       
                state = (x, y, angle - self.turn_angle)


            #uloží pozici před větvením
            elif command == '[':                       
                saved_states.append(state)

            #uloží pozici před větvením
            elif command == ']':                       
                state = saved_states.pop()
                yield (float('nan'), float('nan'))
                x, y, _ = state
                yield (x, y)
       

    def transform(self):
        """přemění axiom podle transformařnčního pravidla zadaný počet iterací"""
        for _ in range(self.iterations):
            self.axiom = "".join(self.rule.get(i,i) for i in self.axiom)
        return self.axiom

    def get_cords(self):
        """vrátí souřadnice, které se dají plotnout"""
        moves = self.transform()
        cor = self.coords(moves)
        x ,y = zip(*cor)
        return x,y


