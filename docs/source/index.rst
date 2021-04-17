.. nQb8or documentation master file.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Documentation
^^^^^^^^^^^^^
.. raw:: html

    <div class="banner">
        <h2>Start developping a python package or application in a minute</h2>
        <a href="./examples/index.html"><img src="_static/banner_small.png" alt="nQb8or" width="100%"/></a>
    </div>

.. |GPLv3| image:: https://img.shields.io/badge/License-GPLv3-blue.svg
   :target: https://www.gnu.org/licenses/gpl-3.0

.. |rtd| image:: https://readthedocs.org/projects/nQb8or/badge/?version=latest
   :target: https://nQb8or.readthedocs.io/en/latest/?badge=latest
   :alt: Documentation Status

+----------------------+------------------------+
| Documentation        | |rtd|                  |
+----------------------+------------------------+
| License              | |GPLv3|                |
+----------------------+------------------------+

About
"""""

nQb8or is a way to quickly setup a environment to develop a project with python.
nQb8or will

* create a directory for the project
* make it a git repository
* copy and customize files to quickly start writing a python package or application
* create a Pipfile and install packages
* create the structures needed to document this project with sphinx with the readthedocs theme
* create an example core package and corresponding tests using pytest
* provide example galleries based on jupyter notebooks
* make an initial commit to a remote repository
* prepare for publishing documentation on the readthedocs.org website
* activate the virtual environment
 

nQb8or uses the config.sh script to to setup the main project properties such as its name or remote git repository.

.. note:: some parts of this documentations such as the examples and the API reference are default features of the projects generated with nQb8or. 

Author
""""""
O. KAUFMANN  

Contributors
""""""""""""
Be the first one !    

.. toctree::
   :maxdepth: 1
   :caption: General Introduction
   
   Description<description.rst>


.. toctree::
   :maxdepth: 1
   :caption: Getting Started

   Installation<installation.rst>
   First Steps<first_steps.rst>

.. toctree::
   :maxdepth: 1
   :caption: Examples
   
   Examples<auto_examples/index.rst>


.. toctree::
   :maxdepth: 1
   :caption: API Reference

   modules<modules.rst>
   uml<uml_diagrams.rst>

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
