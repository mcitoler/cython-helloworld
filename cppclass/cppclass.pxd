cdef extern from "src/cppclass.hpp" namespace "test":
    cdef cppclass CppClass:
        CppClass() except +
        CppClass(int) except +
        int value
        int get_value()
        void add(int)