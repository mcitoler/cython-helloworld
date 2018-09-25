#!/usr/bin/env python

from setuptools import Extension, setup

ext_modules = [
    Extension(name='fib', sources=['fib.pyx', 'cfib.c'], include_dirs=['.']),
]

setup(
    name='cython_helloworld',
    ext_modules=ext_modules
)
