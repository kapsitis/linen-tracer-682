import os
import subprocess
import sys

def main():
    if len(sys.argv) != 2:
        print('Please specify directory')
    else:
        startDir = sys.argv[1]
        workingDir = '%s/Pictures' % startDir
        #arr = os.listdir(workingDir)
        #print(arr)
        
        for file in os.listdir(workingDir):
            if file.endswith(".png"):
                #pngFile = os.path.join(workingDir, file)
                subprocess.call(['magick',file,'-trim','+repage',file], cwd=workingDir)
        #scriptName = 'resize-%s.bat' % startDir
        #subprocess.call([scriptName], cwd=startDir)
        
        srcDir='tale-string-searching-part1/Pictures'
        dstDir='tale-string-searching-part1'
        
        dd = dict([('abab-automaton.png', 440),
            ('aabab-automaton.png',500),
            ('prefix-functions1.png',500),
            ('prefix-functions2.png',500)])
            
        for key in dd:
            subprocess.call(['magick','convert', '%s/%s' % (srcDir,key), '-resize', '%d' % dd[key], '%s/%s'  % (dstDir,key) ])        
        
        subprocess.call(['pandoc','-t','revealjs','-s',
		    '-o','content.html','content.md','--slide-level=2',
		    '-V','revealjs-url=../../reveal.js','--metadata', 'pagetitle="Uzdevumi"',
    		'--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML',
		    '-V','theme=white'], cwd=startDir)


if __name__=='__main__':
    main()

