cdef extern from "cfib.h":
    long cfib(int n)

def fib(n):
    """Returns the nth Fibonacci number."""
    return cfib(n)
