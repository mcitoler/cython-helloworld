# from distutils.core import setup
#
from setuptools import Extension, setup

ext_modules = [
    # Extension(name="fib", sources=["fib.pyx", "cfib.c"], include_dirs=["."])
    Extension(name="shrubbing", sources=["shrubbing.pyx"], language="c++"),
    Extension(name="landscaping", sources=["landscaping.pyx"], language="c++"),
]

setup(ext_modules=ext_modules)
