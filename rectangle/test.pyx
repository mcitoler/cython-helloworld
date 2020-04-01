# cython: annotate=True

from rectangle cimport Rectangle
from rect import PyRectangle, PyPointerRectangle, Square

from cython.operator import dereference as deref


def test_cython_rectangle():
    cdef Rectangle rec = Rectangle(0, 0, 2, 2)
    print("Rectangle area:", rec.getArea())
    cdef int w, h
    rec.getSize(&w, &h)
    print("Rectangle size:", (w, h))


def test_python_rectangle():
    py_rec = PyRectangle(0, 0, 2, 2)
    print("PyRectangle area:", py_rec.get_area())
    print("PyRectangle size:", py_rec.get_size())


def test_python_rectangle():
    py_rec = PyPointerRectangle(0, 0, 2, 2)
    print("PyPointerRectangle area:", py_rec.get_area())
    print("PyPointerRectangle size:", py_rec.get_size())


def test_square():
    cdef list squares = [Square(i) for i in range(5)]
    print("type(squares)", type(squares))
    print("type(squares[0])", type(squares[0]))


def test_casting():
    py_rec = PyRectangle(0, 0, 2, 2)
    # cdef Rectangle rec = py_rec.c_rect  # NOTE: this fails!!
    x0, y0, x1, y1 = py_rec.get_data()
    print(x0, y0, x1, y1)
    cdef Rectangle rec = Rectangle(x0, y0, x1, y1)
    print("Rectangle area after cast from PyRectangle:", rec.getArea())


def test_all():
    test_cython_rectangle()
    test_python_rectangle()
    test_python_rectangle()
    test_square()
    test_casting()