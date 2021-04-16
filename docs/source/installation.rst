Installation 
=============

To clone the repository and setup the environment for using this project
:

.. code-block:: bash

   $ git clone git@github.com:kaufmanno/make\_project.git
   $ cd make\_project/
   $ pipenv shell
   $ pipenv install

To view installed dependencies, see the
`Pipfile <https://github.com/kaufmanno/make_project/blob/master/Pipfile>`__.
Be aware that using *pipfile install* actually installs from the
Pipfile.lock file. Use the --skip-lock option if you want to use the
Pipfile instead.
