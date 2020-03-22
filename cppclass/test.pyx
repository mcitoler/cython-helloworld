from cppclass cimport CppClass

def main():
    cdef CppClass my_class = CppClass(3)
    print(my_class.get_value())
    my_class.add(5)
    print(my_class.get_value())