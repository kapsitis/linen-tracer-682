# -*- coding: utf-8 -*-

import os
import shutil
import subprocess
import glob
import filecmp
import time

import csv
import io
import json
import copy
import re
import sys


def copyDirectory(src, dest):
    try:
        shutil.copytree(src, dest)
    # Directories are the same
    except shutil.Error as e:
        print('Directory not copied. Error: %s' % e)
    # Any error saying that the directory doesn't exist
    except OSError as e:
        print('Directory not copied. Error: %s' % e)


def rmDirectory(src):
    try:
        shutil.rmtree(src)
    # Directories are the same
    except shutil.Error as e:
        print('Directory not removed. Error: %s' % e)
    # Any error saying that the directory doesn't exist
    except OSError as e:
        print('Directory not removed. Error: %s' % e)


def main():
    src_dir = "."
    dest_dir = "../../build"
    rmDirectory(dest_dir)
    os.mkdir(dest_dir)
    all_files = os.listdir(src_dir)
    tex_files = filter(lambda fname: fname.endswith('.tex') and
                                     os.path.isfile('{}/{}'.format(src_dir, fname)), all_files)
    print('TeX files under {} are {}'.format(src_dir, tex_files))
    for ff in tex_files:
        fftexmod = os.path.getmtime('{}/{}'.format(src_dir, ff))
        ffpdf = ff.replace('.tex', '.pdf')
        if os.path.isfile('{}/{}'.format(src_dir, ffpdf)):
            ffpdfmod = os.path.getmtime('{}/{}'.format(src_dir, ffpdf))
        else:
            ffpdfmod = -1
        if fftexmod > ffpdfmod:
            print('Processing TEX "\\def\\mysolution{}\\input{%s}"' % ff)
            subprocess.call(['xelatex', '\\def\\mysolution{}\\input{%s}' % ff], cwd=src_dir)
            time.sleep(2)
            subprocess.call(['xelatex', '\\def\\mysolution{}\\input{%s}' % ff], cwd=src_dir)
            time.sleep(2)
            shutil.copyfile(ff.replace('.tex', '.pdf'), ff.replace('.tex', '-solution.pdf'))
            subprocess.call(['xelatex', '\\def\\nosolution{}\\input{%s}' % ff], cwd=src_dir)
            time.sleep(2)
            subprocess.call(['xelatex', '\\def\\nosolution{}\\input{%s}' % ff], cwd=src_dir)
            time.sleep(2)
            if filecmp.cmp(ff.replace('.tex', '.pdf'), ff.replace('.tex', '-solution.pdf')):
                os.remove("{}/{}".format(src_dir, ff.replace('.tex', '-solution.pdf')))
        else:
            print('Skipping TEX {%s}' % ff)

    all_files = os.listdir(src_dir)
    pdf_files = filter(lambda fname: fname.endswith('.pdf'), all_files)
    for pp in pdf_files:
        shutil.copyfile('{}/{}'.format(src_dir, pp), '{}/[]'.format(dest_dir, pp))


if __name__ == '__main__':
    main()

# xelatex "\def\mysolution{}\input{fall2020-final.tex}"
# xelatex "\def\nosolution{}\input{fall2020-final.tex}"

