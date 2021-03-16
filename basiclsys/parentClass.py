import matplotlib.pyplot as plt

from math import pi, sin, cos

class plotLSystem:
    def __init__(self,axiom , rule, iterations, turn_angle):
        self.toRadians = pi / 180
        self.rule = rule
        self.axiom = axiom
        self.iterations = iterations
        self.turn_angle = turn_angle

    def coords(self, rules):
        position = (0.0, 0.0, 180.0)
        yield (0.0, 0.0)

        for c in rules:
            x, y, angle = position

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
        for _ in range(self.iterations):
            self.axiom = "".join(self.rule.get(i,i) for i in self.axiom)
        return self.axiom

    def get_cords(self,coords):
        x,y = zip(*coords)
        return x,y


#AVILABLE FFRACTALS
#
#
#Pentaplexity
#plot_coords(turtle_to_coords(transform_multiple('F++F++F++F++F',
#{'F': 'F++F++F+++++F-F++F'}, 1),36))   #5

#32-Segment-Curve
#plot_coords(turtle_to_coords(transform_multiple('F+F+F+F',
#{'F': '-F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F+'}, 3),90))   #3

#Peano-gosper-curve
#plot_coords(turtle_to_coords(transform_multiple('FX',
#{'X': 'X+YF++YF-FX--FXFX-YF+','Y': '-FX+YFYF++YF+FX--FX-Y'}, 4),60))   #6

#Sierpinski-Curve
#plot_coords(turtle_to_coords(transform_multiple('F+XF+F+XF',
#{'X': 'XF-F+F-XF+F+XF-F+F-X'}, 4),90)) #8

#Krishna-Anklets
#plot_coords(turtle_to_coords(transform_multiple(' -X--X',
#{'X': 'XFX--XFX'}, 6),45))     #9

#Peano-Curve
#plot_coords(turtle_to_coords(transform_multiple('F',
#{'F': 'F+F-F-F-F+F+F+F-F'}, 4), 90))        #5

#Cross
#plot_coords(turtle_to_coords(transform_multiple('F+F+F+F',
#{'F': 'F+FF++F+F'}, 4), 90))       #5

#Triangle   !!!
#plot_coords(turtle_to_coords(transform_multiple('F+F+F',
#{'F': 'F-F+F'}, 8), 120))  #9

#Dragon Curve     !!!
#plot_coords(turtle_to_coords(transform_multiple('FX',
#{'X': 'X+YF+','Y': '-FX-Y'}, 15),90))   #16

#Quadratic-Koch-Island
#plot_coords(turtle_to_coords(transform_multiple('F+F+F+F',
#{'F': 'F-F+F+FFF-F-F+F'}, 4), 90))     #4
#
#
#
#

#USED
#
#
#levyccurve
#plot_coords(turtle_to_coords(transform_multiple('F',
#{'F': '+F--F+'}, 15), 45))

#32-Segment-Curve
#plot_coords(turtle_to_coords(transform_multiple('F+F+F+F',
#{'F': '-F+F-F-F+F+FF-F+F+FF+F-F-FF+FF-FF+F+F-FF-F-F+FF-F-F+F+F-F+'}, 3),90))   #3

#Peano-gosper-curve
#plot_coords(turtle_to_coords(transform_multiple('FX',
#{'X': 'X+YF++YF-FX--FXFX-YF+','Y': '-FX+YFYF++YF+FX--FX-Y'}, 4),60))   #6

#Dragon Curve     !!!
#plot_coords(turtle_to_coords(transform_multiple('FX',
#{'X': 'X+YF+','Y': '-FX-Y'}, 15),90))   #16

#Siepinski-Sieve
#plot_coords(turtle_to_coords(transform_multiple('FXF--FF--FF',
#{"F":"FF", "X":"--FXF++FXF++FXF--"}, 15),90))   #16
