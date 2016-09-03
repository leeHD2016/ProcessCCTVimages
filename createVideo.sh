#!/bin/bash

#v1.0 03,08,2016


varDate=$(date -d yesterday +%Y%m%d) #set the variable as yesterday.

mkdir -p /home/camera140/videos/$varDate/originals #Create dir to house original snapshots

find /home/camera140/uploads -name "*$varDate*.jpg" -exec mv '{}' /home/camera140/videos/$varDate/originals \; #find all jpegs created yesterday and move them to the dir created above.
cd /home/camera140/videos/$varDate/originals 

for name in *.jpg; do
    convert "$name" -font courier -pointsize 20 -draw "gravity south fill black text 0,12 '$name' fill white text 1,11 '$name'" "$name";
    echo $name;
    done

mencoder mf://*.jpg -mf w=640:h=480:fps=10:type=jpg -ovc lavc -lavcopts vcodec=mpeg4:mbd=2:trell -oac copy -o /home/camera140/videos/$varDate/$varDate.avi

find /home/camera140/videos -maxdepth 1 -name "2016*" -type d -mtime +6 -exec rm -rf {} \;
