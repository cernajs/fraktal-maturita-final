"""
REQUIRE : MATPLOTLIB, MATPLOTLIB_BACKEND_QTQUICK ,PYQT5, NUMPY
"""

# This Python file uses the following encoding: utf-8
import sys
import os

#PATH FOR QML LOAD
from pathlib import Path

"""

l-system fractals

"""
from basiclsys.kochSnowflake import koch
from basiclsys.hilbertCurve import hilbert
from basiclsys.levyCCurve import levy
from basiclsys.segment32 import segment32
from basiclsys.dragonCurve import dragon
from basiclsys.siepinskiCurve import siepinski
"""

growth-fractals

"""
from growth.bush1 import bush1
from growth.stick import stick
from growth.bush2 import bush2
from growth.bush3 import bush3
from growth.stick2 import stick2
from growth.algae import algae
"""

complex fractals

"""
from complex.mand import mand
from complex.julia import julia

#MATPLOTLIB BACKEND
from matplotlib_backend_qtquick.backend_qtquick import (
    NavigationToolbar2QtQuick)
from matplotlib_backend_qtquick.backend_qtquickagg import (
    FigureCanvasQtQuickAgg)
from matplotlib_backend_qtquick.qt_compat import QtGui, QtQml, QtCore


#MAINCLASS
class DisplayBridge(QtCore.QObject):
    """
    Hlavní třída pro propojení pythonu s qml
    Inicializuje canvas, dokáže ho updatovat
    Vytváří toolbar pro ovládání grafu
    """

    coordinates_change = QtCore.Signal(str)

    def __init__(self, parent=None):
        super().__init__(parent)

        #FIGURE
        self.figure = None
        
        #TOOLBAR
        self.toolbar = None

        #MOUSE COORDS
        self._coordinates = ""

    def update_canvas(self, canvas):
        """
        Vytvoří prvotní canvas při spuštění programu
        """

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
    def change_figure(self,fractal,a):
        """
        Dostane jako argument fraktal:fractal a počet iterací:a
        Aktualizuje canvas s nový fraktálem se zadaným počtem iterací
        """
        win = engine.rootObjects()[0]
        canvas = win.findChild(QtCore.QObject, "figure")
        self.figure = canvas.figure
        
        self.axes = self.figure.add_subplot(111)
        self.axes.grid(True)

        x,y = fractal(a)

        self.axes.cla()
        self.axes.plot(x, y)
        canvas.draw_idle()

    """

    ZMĚNÍ 

    """
    def change_figure_complex(self,fractal,n):
        """
        Dostane jako argument kompexní fraktal:fractal a počet iterací:a
        Aktualizuje canvas s nový fraktálem se zadaným počtem iterací
        """
        win = engine.rootObjects()[0]
        canvas = win.findChild(QtCore.QObject, "figure")
        self.figure = canvas.figure
        
        self.axes = self.figure.add_subplot(111)
        self.axes.grid(True)

        img = fractal(n=n)

        self.axes.cla()
        self.axes.imshow(img, cmap="nipy_spectral")
        canvas.draw_idle()


    """

    L-SYSTEM

    Následující funkce propojí funkci pro aktualizaci canvasu
    s obecnou funkcí pro změnu figury:change_figure

    """
    def change_fig_koch(self, a):
        self.change_figure(koch,a)

    def change_fig_hilbert(self,a):
        self.change_figure(hilbert,a)

    def change_fig_levy(self,a):
        self.change_figure(levy,a)

    def change_fig_segment32(self,a):
        self.change_figure(segment32,a)

    def change_fig_dragon(self,a):
        self.change_figure(dragon,a)

    def change_fig_siepinski(self,a):
        self.change_figure(siepinski,a)
    """

    GROWTH

    Následující funkce propojí funkci pro aktualizaci canvasu
    s obecnou funkcí pro změnu figury:change_figure

    """
    def change_fig_bush1(self,a):
        self.change_figure(bush1,a)

    def change_fig_stick(self,a):
        self.change_figure(stick,a)

    def change_fig_bush2(self,a):
        self.change_figure(bush2,a)

    def change_fig_bush3(self,a):
        self.change_figure(bush3,a)

    def change_fig_stick2(self,a):
        self.change_figure(stick2,a)

    def change_fig_algae(self,a):
        self.change_figure(algae,a)
    """
    
    COMPLEX

    Následující funkce propojí funkci pro aktualizaci canvasu
    s obecnou funkcí pro změnu figury:change_figure_complex

    """
    def change_fig_mandel(self,a):
        self.change_figure_complex(mand,a)

    def change_fig_julia(self,a):
        self.change_figure_complex(julia,a)

    """

    COORDINATES


    """
    def get_coordinates(self):
        """vrátí aktuální souřadnice kurzoru"""
        return self._coordinates

    def set_coordinates(self, coordinates):
        """aktualizuje hodnotu souřadnic"""
        self._coordinates = coordinates
        self.coordinates_change.emit(self._coordinates)

    coordinates = QtCore.Property(str, get_coordinates, set_coordinates,
                                  notify=coordinates_change)
    """

    TOOLBAR

    """
    @QtCore.Slot()
    def pan(self, *args):
        """Propojí pan v toolbaru v qml s pythonem"""
        self.toolbar.pan(*args)

    @QtCore.Slot()
    def zoom(self, *args):
        """Propojí zoom v toolbaru v qml s pythonem"""
        self.toolbar.zoom(*args)

    @QtCore.Slot()
    def home(self, *args):
        """Propojí home button v toolbaru v qml s pythonem"""
        self.toolbar.home(*args)

    @QtCore.Slot()
    def back(self, *args):
        """Propojí back button v toolbaru v qml s pythonem"""
        self.toolbar.back(*args)

    @QtCore.Slot()
    def forward(self, *args):
        """Propojí forward button v toolbaru v qml s pythonem"""
        self.toolbar.forward(*args)
    """
    L-SYS SLOTS

    Následující funkce propojí tlačítko a slider v qml
    s python backend funkcí pro generaci určitého fraktálu 

    """
    @QtCore.Slot(int)
    def display_koch(self,a):
        self.change_fig_koch(a)

    @QtCore.Slot(int)
    def display_hilbert(self,a):
        self.change_fig_hilbert(a)

    @QtCore.Slot(int)
    def display_levyC(self,a):
        self.change_fig_levy(a)

    @QtCore.Slot(int)
    def display_segment32(self,a):
        self.change_fig_segment32(a)

    @QtCore.Slot(int)
    def display_dragon(self,a):
        self.change_fig_dragon(a)

    @QtCore.Slot(int)
    def display_siepinski(self,a):
        self.change_fig_siepinski(a)
    """
    
    GROWTH SLOTS
    
    Následující funkce propojí tlačítko a slider v qml
    s python backend funkcí pro generaci určitého fraktálu 
    
    """
    @QtCore.Slot(int)
    def display_bush1(self,a):
        self.change_fig_bush1(a)

    @QtCore.Slot(int)
    def display_stick(self,a):
        self.change_fig_stick(a)

    @QtCore.Slot(int)
    def display_bush2(self,a):
        self.change_fig_bush2(a)

    @QtCore.Slot(int)
    def display_bush3(self,a):
        self.change_fig_bush3(a)

    @QtCore.Slot(int)
    def display_stick2(self,a):
        self.change_fig_stick2(a)

    @QtCore.Slot(int)
    def display_algae(self,a):
        self.change_fig_algae(a)

    """
    
    COMPLEX

    Následující funkce propojí tlačítko a slider v qml
    s python backend funkcí pro generaci určitého fraktálu 
    
    """
    @QtCore.Slot(int)
    def display_mand(self,a):
        self.change_fig_mandel(a)

    @QtCore.Slot(int)
    def display_julia(self,a):
        self.change_fig_julia(a)

    """



    """

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
    displayBridge.update_canvas(win.findChild(QtCore.QObject, "figure"))

    app.exec_()

