#!/usr/bin/bash
cd /opt/timestudy
#making archive folders with timestamps
timestamp=$(date +"%m%d%y_%H")
mkdir -p /opt/timestudy/archived/$timestamp
mkdir -p /media/timestudyhost/.archivedcsvs/$timestamp
mkdir -p /media/timestudyhost/TimeStudyCSVs/$timestamp

#merging the files into one
cat /opt/timestudy/*.txt >> /media/timestudyhost/timestudy.csv
#copying files to the file host
cp /opt/timestudy/*.txt /media/timestudyhost/.archivedcsvs/$timestamp/
cp /opt/timestudy/*.txt /media/timestudyhost/TimeStudyCSVs/$timestamp/

#mving the files off to archived locally
mv /opt/timestudy/*.txt /opt/timestudy/archived/$timestamp/
