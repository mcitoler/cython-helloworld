from setuptools import Extension, setup

from Cython.Compiler import Options

Options.annotate = True

ext_modules = [
    Extension(
        name="fib.fib",
        sources=["fib/fib.pyx", "fib/src/cfib.c"],
        include_dirs=["fib/src"],
        language="c",
    ),
    Extension(
        name="landscaping.shrubbing",
        sources=["landscaping/shrubbing.pyx"],
        language="c++",
    ),
    Extension(
        name="landscaping.landscaping",
        sources=["landscaping/landscaping.pyx"],
        language="c++",
    ),
    Extension(
        name="cppclass.test",
        sources=["cppclass/test.pyx", "cppclass/src/cppclass.cpp"],
        include_dirs=["cppclass/src"],
        language="c++",
    ),
    Extension(
        name="rectangle.rect",
        sources=["rectangle/rect.pyx", "rectangle/src/rectangle.cpp"],
        include_dirs=["rectangle/src"],
        language="c++",
    ),
    Extension(
        name="rectangle.test",
        sources=["rectangle/test.pyx", "rectangle/src/rectangle.cpp"],
        include_dirs=["rectangle/src"],
        language="c++",
    ),
]

setup(setup_requires=["cython"], ext_modules=ext_modules)
