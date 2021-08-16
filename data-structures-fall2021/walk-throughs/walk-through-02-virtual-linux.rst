Walk-Through 2: Running C++ on Virtual Linux
=============================================

Unlike the previous walk-through (preoccupied with development environment on Windows), 
this walk-through shows a simple production environment on a Linux machine. 
If you feel better about Linux Subsystem for Windows (instead of a full virtual Linux)
you can choose it as well. On the other hand, the Linux guest as described in this 
lab is meant to be similar to the environment where your lab exercises are graded.

Unlike Java and Scala, C++ is not meant to be a platform-independent programming technology; 
it may happen that it compiles and runs on one environment (such as Windows 10 using Microsoft C++ 
compiler), but fails to run in another environment (such as Xubuntu Linux using g++ compiler). 
It is your responsibility to ensure that it runs on Linux - since that is the only thing that
matters for the evaluation. 






Objective
---------

We need to create a minimalistic Debian-style Linux machine to be used for 
building and testing C++ code - using reasonable amount of automation (to integrate
with the code repository and to run all testcases automatically). 

Overview of Steps
^^^^^^^^^^^^^^^^^

**Step 1** 
  Set up a VirtualBox and a guest: Install Oracle VirtualBox and initialize its guest machine with Xubuntu OS.
  
**Step 2**
  Run ``git`` from the command-line: Use the ``git`` utility to checkout some code from your repository and also 
  to commit some last-minute changes from Linux to the repository. 
	
**Step 3**
  Build with a Makefile: Build and run your code on some testfiles using a ``Makefile``. 
  
**Step 4**  
  Build and run C++ code manually: Use Linux command-line (but no Makefile-related tools) to 
  run executables from the command line. 
  
**Step 5**
  Copy testfiles using ``WinSCP``: Connect to the Linux using ``Putty`` (including your neighbor's computer).  
  
**Step 6**  
  Test out the ``diff`` utility: Compare the test outputs with expected outputs, use the right switches to 
  handle Windows/Linux whitespace reasonably. 
  

Steps in Detail
----------------

Step 1: Set up a VirtualBox and a Guest
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We should start by downloading Oracle VirtualBox.

