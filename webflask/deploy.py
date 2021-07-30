import os
import os.path
import shutil

def main():
    rootDir = os.path.abspath(".")
    destRootDir = '/usr/local/webflask'
    for root, dirs, files in os.walk(rootDir):
        path = root.split(os.sep)
        if len(path) < 6:
            continue
        if len(path) > 6 and path[6] in ['tests', 'venv', 'instance']:
            continue
        if len(path) > 7 and path[7] == '__pycache__':
            continue
        for file in files:
            extension = os.path.splitext(file)[1].lower()
            if extension in ['.cfg', '.in', '.ini', '.py', '.html'] or (len(path) > 8 and path[8] in ['reveal.js.40', 'algorithms-slides']):
                srcpath = list(path)
                srcpath.append(file)
                #destpath = ['c:', 'Users', 'kapsitis', 'tmp']
                destpath = destRootDir.split(os.sep)
                destpath = destpath + srcpath[6:]

                print('Copying ' + '/'.join(srcpath))
                print('  to file ' + '/'.join(destpath))
                os.makedirs(os.path.dirname('/'.join(destpath)), exist_ok=True)
                shutil.copyfile('/'.join(srcpath), '/'.join(destpath))

if __name__ == '__main__':
    main()

