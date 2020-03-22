from libcpp.vector cimport vector

from cppclass cimport CppClass

def test_class():
    cdef CppClass my_class = CppClass(3)
    print(my_class.get_value())
    my_class.add(5)
    print(my_class.get_value())

def test_template():
    cython_test_template()

cdef void cython_test_template():
    cdef CppClass element
    cdef vector[CppClass] vec
    cdef int i
    vec.reserve(3)
    for i in range(3):
        element = CppClass(i)
        vec.push_back(element)
    for element in vec:
        print(element.get_value())