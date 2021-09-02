import sys, os
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
# from PySide6.QtCore import QObject, Slot, Signal

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # engine.load(os.path.join(os.path.dirname(__file__), "qml/login.qml"))
    engine.load(os.path.join(os.path.dirname(__file__), "qml/app.qml"))
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())