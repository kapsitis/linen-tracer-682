#!/bin/bash

python "c:\Users\kalvis.apsitis\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin\dev_appserver.py" c:\Users\kalvis.apsitis\workspace\linen-tracer-682
python "c:\Users\kalvis.apsitis\AppData\Local\Google\Cloud SDK\google-cloud-sdk\platform\google_appengine\appcfg.py" update c:\Users\kalvis.apsitis\workspace\linen-tracer-682


rem conda create -n py27 python=2.7 anaconda
rem conda activate py27 
rem conda deactivate

rem https://docs.anaconda.com/anaconda/user-guide/tasks/switch-environment/