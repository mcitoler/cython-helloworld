from rectangle cimport Rectangle


# Create a Cython extension type which holds a C++ instance
# as an attribute and create a bunch of forwarding methods
# Python extension type.
cdef class PyRectangle:
    cdef Rectangle c_rect  # Hold a C++ instance which we're wrapping

    cdef say_hello(self)


cdef class PyPointerRectangle:
    cdef Rectangle *c_rect  # hold a pointer to the C++ instance which we're wrapping

    cdef say_hello(self)


cdef class Square:
    cdef public int size
