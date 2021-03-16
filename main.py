# This Python file uses the following encoding: utf-8
import sys
import os

#PATH FOR QML LOAD
from pathlib import Path

#FIRT WINDOW FRACTALS
from basiclsys.kochSnowflake import *
from basiclsys.hilbertCurve import *
from basiclsys.levyCCurve import *
from basiclsys.segment32 import *
from basiclsys.dragonCurve import *
from basiclsys.siepinskiCurve import *
#
#
#GROWTH
from growth.bush1 import *
from growth.stick import *
from growth.bush2 import *
from growth.bush3 import *
from growth.stick2 import *
from growth.algae import *
#
#
#COMPLEX
from complex.mand import *
from complex.julia import *

#MATPLOTLIB BACKEND
from matplotlib_backend_qtquick.backend_qtquick import (
    NavigationToolbar2QtQuick)
from matplotlib_backend_qtquick.backend_qtquickagg import (
    FigureCanvasQtQuickAgg)
from matplotlib_backend_qtquick.qt_compat import QtGui, QtQml, QtCore

#CONVERTING ANGLE TO RADIANS 
from math import pi, cos, sin


#MAINCLASS
class DisplayBridge(QtCore.QObject):

    coordinatesChanged = QtCore.Signal(str)

    def __init__(self, parent=None):
        super().__init__(parent)

        #FIGURE
        self.figure = None
        #TOOLBAR
        self.toolbar = None

        #MOUSE COORDS
        self._coordinates = ""

    def updateWithCanvas(self, canvas):

        self.figure = canvas.figure
        self.toolbar = NavigationToolbar2QtQuick(canvas=canvas)

        # make a small plot
        self.axes = self.figure.add_subplot(111)
        self.axes.grid(True)
        
        self.axes.text(0.47,0.5,"Vítejte")
        
        canvas.draw_idle()

        # connect for displaying the coordinates
        self.figure.canvas.mpl_connect('motion_notify_event', self.on_motion)



    #
    #
    #
    #
    #CHANGE FRACTAL PLOT L-SYSTEM
    def changeFigure(self,fractal,a):
        win = engine.rootObjects()[0]
        canvas = win.findChild(QtCore.QObject, "figure")
        self.figure = canvas.figure
        
        self.axes = self.figure.add_subplot(111)
        self.axes.grid(True)

        x,y = fractal(a)

        self.axes.cla()
        self.axes.plot(x, y)
        canvas.draw_idle()

    #
    #
    #CHANGE FRACTAL PLOT COMPLEX
    def changeFigureComplex(self,fractal,n):
        win = engine.rootObjects()[0]
        canvas = win.findChild(QtCore.QObject, "figure")
        self.figure = canvas.figure
        
        self.axes = self.figure.add_subplot(111)
        self.axes.grid(True)

        img = fractal(n=n)

        self.axes.cla()
        self.axes.imshow(img, cmap="plasma")
        canvas.draw_idle()


    #
    #
    #L-SYSTEM-FRACTALS
    #
    #
    def changeFigKoch(self, a):
        self.changeFigure(koch,a)

    def changeFigHilbert(self,a):
        self.changeFigure(hilbert,a)

    def changeFigLevy(self,a):
        self.changeFigure(levy,a)

    def changeFigSegment32(self,a):
        self.changeFigure(segment32,a)

    def changeFigDragon(self,a):
        self.changeFigure(dragon,a)

    def changeFigSiepinski(self,a):
        self.changeFigure(siepinski,a)
    #
    #
    #GROWTH
    #
    #
    def changeFigBush1(self,a):
        self.changeFigure(bush1,a)

    def changeFigStick(self,a):
        self.changeFigure(stick,a)

    def changeFigBush2(self,a):
        self.changeFigure(bush2,a)

    def changeFigBush3(self,a):
        self.changeFigure(bush3,a)

    def changeFigStick2(self,a):
        self.changeFigure(stick2,a)

    def changeFigAlgae(self,a):
        self.changeFigure(algae,a)
    #
    #
    #COMPLEX
    #
    #
    def changeFigMandel(self,a):
        self.changeFigureComplex(mand,a)

    def changeFigJulia(self,a):
        self.changeFigureComplex(julia,a)

    #
    #
    #
    #
    # COORDINATES
    #
    #
    def getCoordinates(self):
        return self._coordinates

    def setCoordinates(self, coordinates):
        self._coordinates = coordinates
        self.coordinatesChanged.emit(self._coordinates)

    coordinates = QtCore.Property(str, getCoordinates, setCoordinates,
                                  notify=coordinatesChanged)
    #
    #
    #TOOLBAR
    #
    #
    @QtCore.Slot()
    def pan(self, *args):

        self.toolbar.pan(*args)

    @QtCore.Slot()
    def zoom(self, *args):

        self.toolbar.zoom(*args)

    @QtCore.Slot()
    def home(self, *args):
        self.toolbar.home(*args)

    @QtCore.Slot()
    def back(self, *args):
        self.toolbar.back(*args)

    @QtCore.Slot()
    def forward(self, *args):
        self.toolbar.forward(*args)
    #
    #

    #L-SYS SLOTS
    #
    #
    #
    #
    @QtCore.Slot(int)
    def displayKoch(self,a):
        self.changeFigKoch(a)

    @QtCore.Slot(int)
    def displayHilbert(self,a):
        self.changeFigHilbert(a)

    @QtCore.Slot(int)
    def displayLevyC(self,a):
        self.changeFigLevy(a)

    @QtCore.Slot(int)
    def displaySegment32(self,a):
        self.changeFigSegment32(a)

    @QtCore.Slot(int)
    def displayDragon(self,a):
        self.changeFigDragon(a)

    @QtCore.Slot(int)
    def displaySiepinski(self,a):
        self.changeFigSiepinski(a)
    #
    #
    #GROWTH SLOTS
    #
    #
    #
    @QtCore.Slot(int)
    def displayBush1(self,a):
        self.changeFigBush1(a)

    @QtCore.Slot(int)
    def displayStick(self,a):
        self.changeFigStick(a)

    @QtCore.Slot(int)
    def displayBush2(self,a):
        self.changeFigBush2(a)

    @QtCore.Slot(int)
    def displayBush3(self,a):
        self.changeFigBush3(a)

    @QtCore.Slot(int)
    def displayStick2(self,a):
        self.changeFigStick2(a)

    @QtCore.Slot(int)
    def displayAlgae(self,a):
        self.changeFigAlgae(a)

    #
    #
    #COMPLEX
    #
    #
    @QtCore.Slot(int)
    def displayMand(self,a):
        self.changeFigMandel(a)

    @QtCore.Slot(int)
    def displayJulia(self,a):
        self.changeFigJulia(a)

    #
    #
    #



    def on_motion(self, event):
        if event.inaxes == self.axes:
            self.coordinates = f"({event.xdata:.2f}, {event.ydata:.2f})"

#MAIN APP FUNCTION
#
#
if __name__ == "__main__":
    QtCore.QCoreApplication.setAttribute(QtCore.Qt.AA_EnableHighDpiScaling)
    app = QtGui.QGuiApplication(sys.argv)
    engine = QtQml.QQmlApplicationEngine()

    #INIT BACKEND CLASS
    displayBridge = DisplayBridge()

    #CONNECT PYTHON TO QML
    context = engine.rootContext()
    context.setContextProperty("displayBridge", displayBridge)

    #MATPLOTLIB
    QtQml.qmlRegisterType(FigureCanvasQtQuickAgg, "Backend", 1, 0, "FigureCanvas")

    #LOAD QML
    qmlFile = Path(Path.cwd(), Path(__file__).parent, "main.qml")
    engine.load(QtCore.QUrl.fromLocalFile(str(qmlFile)))

    win = engine.rootObjects()[0]
    displayBridge.updateWithCanvas(win.findChild(QtCore.QObject, "figure"))

    app.exec_()

