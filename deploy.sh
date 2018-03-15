#!/bin/bash

. ./garden-credentials.sh

BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

if [ "$BRANCH" = "master" ]
then
  echo "Deploying to host: $GARDEN_HOSTNAME"
  
  # Messy hack to get deployment working. This should be installed by default into the jenkins container but that doesnt seem to be working
  sudo apt update && sudo apt -y install sshpass

  sshpass -p $GARDEN_PASSWORD ssh $GARDEN_USER:$GARDEN_PASSWORD@$GARDEN_HOSTNAME 'cd workspace/GreenSense/Index/sketches/monitor/SoilMoistureSensorCalibratedSerial && sh pull-build-and-upload.sh'
else
  echo "Can't deploy dev branch. Switch to master."
fi
