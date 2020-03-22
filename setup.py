from setuptools import Extension, setup

ext_modules = [
    Extension(
        name="fib.fib", 
        sources=["fib/fib.pyx", "fib/src/cfib.c"], 
        include_dirs=["fib/src"], 
        language="c"
    ),
    Extension(
        name="landscaping.shrubbing", sources=["landscaping/shrubbing.pyx"], language="c++"
    ),
    Extension(
        name="landscaping.landscaping", sources=["landscaping/landscaping.pyx"], language="c++"
    ),
    Extension(
        name="cppclass.test", 
        sources=["cppclass/test.pyx", "cppclass/src/cppclass.cpp"], 
        include_dirs=["cppclass/src"], 
        language="c++"
    ),
]

setup(ext_modules=ext_modules)
