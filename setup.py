import pathlib
from definitions import PROJECT, AUTHOR, VERSION, LICENSE, SHORT_DESCRIPTION, ROOT_DIR, URL
from setuptools import setup

# The text of the README file
README = (ROOT_DIR / 'README.md').read_text()

# This call to setup() does all the work
setup(
    name=PROJECT,
    version=VERSION,
    description=SHORT_DESCRIPTION,
    long_description=README,
    long_description_content_type='text/markdown',
    url=URL,
    author=AUTHOR,
    author_email='',
    license=LICENSE,
    classifiers=[
        "License :: OSI Approved :: GPLv3 License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
    ],
    packages=["core"],
    include_package_data=True,
    install_requires=["feedparser", "html2text"],
    entry_points={
        "console_scripts": [
            f"{PROJECT}=reader.__main__:main",
        ]
    },
)

