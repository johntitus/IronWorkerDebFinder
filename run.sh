#!/bin/bash
payloadFound="false"
value=""
for var in "$@"
do
  if [ $payloadFound = "true" ]
  then
    #echo "readfile"
    value=$(cat $var)
    payloadFound="false"
    #echo $value
  fi

  if [ $var = "-payload" ]
  then
    #echo "found"
    payloadFound="true"
  fi
done
echo "Dependencies for $value"
apt-get --print-uris --yes install $value | grep ^\' | cut -d\' -f2