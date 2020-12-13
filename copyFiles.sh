#!/bin/bash
#A simple release script to copy some files from one directory to another.

echo " ------------------------"
echo "| Welcome to the script! |"
echo " ------------------------"
printf "\n"

firstline=$(head -n 1 source/changelog.md) #Get version number from README.md
read -a splitfirstline <<< $firstline #Split the firstline to get version #
version=${splitfirstline[1]} 

echo "You are building version $version"
echo "Press 1 if you want to continue or 0 to leave: "
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "Copying will commence now"
  echo "========================="
  for i in source/* #Directory to copy from
    do
      if [ "$i" == "source/secretinfo.md" ] #File you do not want copied
      then
        echo "***$i will not be copied over***"
      else
        echo "$i is being copied..."
        cp $i build/. #Directory everything is copied to.
      fi
  done
printf "\n"
echo "Build version $version contains:"
echo "================================"
printf "\n"
cd build/ && ls -a
cd ..
else
    echo "Comeback when you are ready."
fi
