import matplotlib.pyplot as plt

from math import pi, sin, cos

class plotGrowth:
    def __init__(self, axiom , rule, iterations, turn_angle):
        self.toRadians = pi / 180
        self.rule = rule
        self.axiom = axiom
        self.iterations = iterations
        self.turn_angle = turn_angle

    def coords(self,rule):
        saved_states = list()
        state = (0, 0, 90)
        yield (0, 0)

        for command in rule:
            x, y, angle = state

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

            elif command == '[':                       
                saved_states.append(state)

            elif command == ']':                       
                state = saved_states.pop()
                yield (float('nan'), float('nan'))
                x, y, _ = state
                yield (x, y)
       

    def transform(self):
        for _ in range(self.iterations):
            self.axiom = "".join(self.rule.get(i,i) for i in self.axiom)
        return self.axiom

    def get_cords(self):
        moves = self.transform()
        cor = self.coords(moves)
        x ,y = zip(*cor)
        return x,y

#a = plotGrowth('F', {'F': 'FF[++F][-FF]'}, 6, 22)  #bush1
#a = plotGrowth("X", {"X":"F+[[X]-X]-F[-FX]+X", "F":"FF"}, 6,20)
#a = plotGrowth('A', {'F': 'FF', 'A': 'F[+AF-[A]--A][---A]'}, 6, 22.5)   #1 stcik
#a = plotGrowth('Y', {'X': ' X[-FFF][+FFF]FX', 'Y': ' YFX[+Y][-Y]'}, 8, 25.7)   #1   bush2
#a = plotGrowth('F', {'F': ' F[+FF][-FF]F[-F][+F]F'}, 5, 35)    #1
#a = plotGrowth('F', {"F":"FF-[XY]+[XY]",'X': '+FY', 'Y': '-FX'}, 7, 22.5)  #0
#a = plotGrowth('X', {"F":"FF",'X': 'F[+X]F[-X]+X'}, 10, 20) #1

"""
a = plotGrowth('aF',
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
  1, 12)

"""
##x,y = a.get_cords()
#plt.plot(x,y)
#plt.show()

