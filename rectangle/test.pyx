# cython: annotate=True

from rectangle cimport Rectangle
from rect import PyRectangle, PyPointerRectangle, Square
from rect cimport PyRectangle as CyRectangle
from rect cimport PyPointerRectangle as CyPointerRectangle

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


def test_casting_PyRectangle():
    py_rec = PyRectangle(0, 0, 2, 2)
    print("PyRectangle:", (py_rec.x0, py_rec.y0, py_rec.x1, py_rec.y1))
    # py_rec.say_hello()  # NOTE: This fails as it's supposed to 
    cdef CyRectangle cy_rec = <CyRectangle>py_rec
    cy_rec.say_hello()
    cdef Rectangle rec = <Rectangle>cy_rec.c_rect
    print("Rectangle area after cast from PyRectangle:", rec.getArea())
    rec.move(2, 2)
    print("Rectangle after move:", (rec.x0, rec.y0, rec.x1, rec.y1))
    print("PyRectangle after Rectangle move:", (py_rec.x0, py_rec.y0, py_rec.x1, py_rec.y1))


def test_casting_PyPointerRectangle(): 
    py_rec_ptr = PyPointerRectangle(0, 0, 2, 2)
    print("PyPointerRectangle:", (py_rec_ptr.x0, py_rec_ptr.y0, py_rec_ptr.x1, py_rec_ptr.y1))
    # py_rec_ptr.say_hello()  # NOTE: This fails as it's supposed to 
    cdef CyPointerRectangle cy_rec_ptr = <CyPointerRectangle>py_rec_ptr
    cy_rec_ptr.say_hello()
    cdef Rectangle *rec_ptr = <Rectangle*>cy_rec_ptr.c_rect
    print("Rectangle area after cast from PyPointerRectangle:", rec_ptr.getArea())
    rec_ptr.move(2, 2)
    print("Rectangle ptr after move:", (rec_ptr.x0, rec_ptr.y0, rec_ptr.x1, rec_ptr.y1))
    print(
        "PyPointerRectangle after Rectangle ptr move:", 
        (py_rec_ptr.x0, py_rec_ptr.y0, py_rec_ptr.x1, py_rec_ptr.y1)
    )


def test_all():
    test_cython_rectangle()
    test_python_rectangle()
    test_python_rectangle()
    test_square()
    test_casting_PyRectangle()
    test_casting_PyPointerRectangle()