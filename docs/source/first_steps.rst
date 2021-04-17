First Steps
===========

Hello World
-----------

Before using nQb8or, please clone the repository and install the prerequisites as described in the installation section. 
Once this is done, you may configure your new project by editing the config.sh file. change the project name, author, remote repository etc.
If you want to use a remote repository, it is the right time to create it (create an empty one, all the required files to start your project will be added by nQb8or).

Then you may start the project creation by opening a terminal and typing the following command:

.. code-block:: bash

   . hatching.sh

This will create a directory for your new project and generate the required structure to start developping quickly.
Make sure that you read the messages to check that every step passes without errors. You will also have to confirm a couple of steps.  

When this script ends, it will move to your project directory, create an initial commit and activate the project virtualenv (if you didn't change corresponding parameters in the default config.sh file).
At this point, you should launch the quickstart script to generate a first version of the documentation. This can be done by entering the following command in the terminal:

.. code-block:: bash

   . quickstart.sh

When the documentation is built, it will be commited to your local git repository and a page will open in your browser (local version of the documentation).
If you are using a remote repository, the changes will be pushed to this repository (if you don't want to use a remote repo, you should edit the build_docs.sh script and comment the line with the push command".


A few steps further
-------------------

You may now start editing the files that nQb8or prepared for you to customize your project. 
A good starting point is editing the README.md and docs/source/index.rst files to describe your project. 
Then you may create a cool logo for your project. The logo that should be copied to docs/source/_static/logo.png. 
A similar thing may be done for the welcome banner.
Once this is done, you should rebuild the documentation using the following command in the terminal:

.. code-block:: bash

   . build_docs.sh

This command with also make a commit and push it to your remote repository.  

If you want to share your documentation on the readthedocs.org website, sign-in on that website and configure a build pointing to your remote repository (you may use a webhookfor automated builts).
The .readthedocs.yaml file in the project directory is a configuration file that may be edited for tuning the built.


Start developping your project
------------------------------

You are now ready to start developping your package or application. You could start to edit the fake class and function in core/core.py. 
Make sure to document your code using numpy style docstrings. 
You should also modify the unit test accordingly (by default pytest is used).
Once this is done, add your modifications to a commit with commands like this one:

.. code-block:: bash

   git add core/core.py tests/test_core_core.py
   git commit -m "Adds first functionalities to core.core as well as the related tests"

Then rebuild the documentation with the same command as before:

.. code-block:: bash

   . build-docs.sh

The two commits will be pushed to your remote repository. 

.. warning:: When collaborating on a project you should make sure that your local copy is clean and pull from remote before pushing


Some final tips
---------------
If you feel that some operations are still unclear, deepen your knowledge on

* coding with python, documenting code with docstrings and writing tests with pytest
* writing example code with jupyter
* using git for tracking changes in files
* using internet hosting services for sofware development under git (such as gitlab or github) 
* the RestructuredText (rst) syntax
* using the sphinx documentation tool and the nbsphinx extension
* using the readthedocs.org services.
