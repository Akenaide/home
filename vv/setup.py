from setuptools import setup

setup(
    name='vv',
    version='1.0',
    py_modules=['vv'],
    install_requires=[
        'neovim',
        'click',
    ],
    entry_points='''
        [console_scripts]
        vv=vv:main
    ''',
)
