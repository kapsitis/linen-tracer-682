import os
from shutil import copyfile

def main():
    dirNames = ['.','ddgatve','ddgatve/templates']
    for dirName in dirNames:
        for fileName in os.listdir(dirName):
            if fileName.endswith('.html') or fileName.endswith('.py'):
                copyfile(os.path.join(dirName,fileName),
                        os.path.join('/usr/local/webflask',dirName,fileName))

if __name__ == '__main__':
    main()
