from pathlib import Path

def get_version():
    cmd = ['git', 'describe', '--tags', '--abbrev=0']
    output = check_output(cmd)
    return output.decode('latin1').strip()
    
def get_release():
    cmd = ['git', 'describe', '--tags']
    output = check_output(cmd)
    return output.decode('latin1').strip()

PROJECT = u'{project}'
AUTHOR = u'{author}'
VERSION = get_version()
RELEASE = get_release()
LICENSE = u'GPLv3'
SHORT_DESCRIPTION = u'@@@ Please insert a short description here...'
ROOT_DIR = Path(__file__).parent.absolute()
URL = u'{repoaddress}' + f'/{PROJECT}'
