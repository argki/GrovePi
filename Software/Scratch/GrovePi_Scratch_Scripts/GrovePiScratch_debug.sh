#! /bin/bash

id=$(ps aux | grep "python3 GrovePiScratch.py" | grep -v grep | awk '{print $2}')
kill -15 $id 2> /dev/null
python3 /home/pi/Desktop/GrovePi/Software/Scratch/GrovePiScratch.py
