# nQb8or  
### O. KAUFMANN, 2021.  

nQb8or (pronounced as "incubator") is a way to quickly setup an environment to develop a package or application with python under linux using bas shell scripts.
  
## Table of Contents
1. [Description of the project](#Description-of-the-project)
2. [Prerequisites](#Prerequisites)
3. [Installation](#Installation)
4. [Contributing](#Contributing)
5. [License](#License)
6. [Citation](#Citation)
7. [Contact](#Contact)

## Description of the project <a name="Description-of-the-project"></a>

nQb8or will

    create a directory for the project

    make it a git repository

    copy and customize files to quickly start writing a python package or application

    create a Pipfile and install packages

    create the structures needed to document this project with sphinx with the readthedocs theme

    create an example core package and corresponding tests using pytest

    provide example galleries based on jupyter notebooks

    make an initial commit to a remote repository

    prepare for publishing documentation on the readthedocs.org website

    activate the virtual environment

nQb8or uses the config.sh script to setup the main project properties such as its name or remote git repository.  

## Prerequisites <a name="Prerequisites"></a>

The project is developed in a virtual environment using pipenv. It is therefore necessary to install pyenv and pipenv before starting the installation of the program.  

Pyenv will setup the virtual environment with the correct version of Python. Pipenv will add the required python dependencies automatically during installation.  

Refer to this [link](https://github.com/pyenv/pyenv-installer) to install Pyenv and this [link](https://pipenv.pypa.io/en/latest/install/) to install Pipenv, the prerequisites.  
## Installation <a name="Installation"></a>
To clone the repository and setup the environment for using this project :

.. code-block:: bash 

   $  git clone git@github.com:kaufmanno/nQb8or.git  
   $  cd nQb8or/  
   $  pipenv shell  
   $  pipenv install   

To view installed dependencies, see the [Pipfile](https://github.com/kaufmanno/nQb8or/blob/master/Pipfile). Be aware that using *pipfile install* actually installs from the Pipfile.lock file. Use the --skip-lock option if you want to use the Pipfile instead.  
  

## Contributing <a name="Contributing"></a>

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Also have a look at this note about [contributing](https://github.com/kaufmanno/nQb8or/blob/master/CONTRIBUTING.md).  

Please note we have a [code of conduct](https://github.com/kaufmanno/nQb8or/blob/master/CODE_OF_CONDUCT.md), please follow it in all your interactions with the project.  


## License <a name="License"></a>

The license of the project is avalaible on the [license](https://github.com/kaufmanno/nQb8or/blob/master/LICENSE) file.  

## Citation <a name="Citation"></a>

If you are using nQb8or to develop your project please add a reference to the [nQb8or](https://github.com/kaufmanno/nQb8or) in your documentation.  

## Contact <a name="Contact"></a>

We are interested in your feedback. Please create issues for bug reports, suggestions, PR and questions.  

