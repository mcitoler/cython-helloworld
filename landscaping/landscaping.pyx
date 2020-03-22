from shrubbing cimport Shrubbery
import shrubbing

def main():
    cdef Shrubbery sh = shrubbing.standard_shrubbery()
    print("Shrubbery size is", sh.width, 'x', sh.length)