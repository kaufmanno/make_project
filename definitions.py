from pathlib import Path

def get_version():
    cmd = ['git', 'describe', '--tags', '--abbrev=0']
    output = check_output(cmd)
    return output.decode('latin1').strip()
    
def get_release():
    cmd = ['git', 'describe', '--tags']
    output = check_output(cmd)
    return output.decode('latin1').strip()

PROJECT = 'nQb8or'
AUTHOR = 'O. KAUFMANN'
VERSION = get_version()
RELEASE = get_release()
LICENSE = 'GPLv3'
SHORT_DESCRIPTION = 'nQb8or (pronounced as "incubator") is a way to quickly setup an environment to develop a package' \
                    ' or application with python under linux using bash shell scripts'
ROOT_DIR = Path(__file__).parent.absolute()
URL = f'https://github.com/kaufmanno/{PROJECT}'
