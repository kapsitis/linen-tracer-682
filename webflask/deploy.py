from distutils.dir_util import copy_tree

def copytree(src, dst, symlinks=False, ignore=None):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)

def main():
    copy_tree('.', 'c:/Users/kapsitis/tmp')

if __name__ == '__main__':
    main()

