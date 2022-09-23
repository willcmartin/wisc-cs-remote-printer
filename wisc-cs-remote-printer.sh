#!/bin/bash

# ssh info
USER=willmartin

# get command line args
COPIES=1
while getopts p:f:n: flag
do
    case "${flag}" in
        p) PRINTER=${OPTARG};;
        f) FILE=${OPTARG};;
        n) COPIES=${OPTARG};;
    esac
done

# get user info
echo "----------------"
echo "USER INFORMATION"
echo "----------------"
ssh $USER@best-linux.cs.wisc.edu "lpquota"

# make print directory on remote
ssh $USER@best-linux.cs.wisc.edu "rm -rf print; mkdir print"

# copy file
echo -e "\n------------"
echo "COPYING FILE"
echo "------------"
scp $FILE $USER@best-linux.cs.wisc.edu:print

# print
echo -e "\n--------------"
echo "PRINTER STATUS"
echo "--------------"
ssh $USER@best-linux.cs.wisc.edu "lpq -P ${PRINTER}"

echo -e "\n------------"
echo "VERIFICATION"
echo "------------"
while true; do
    read -p "PRINT ${COPIES} COPY/COPIES OF '${FILE}' TO PRINTER '${PRINTER}' (Y/N): " yn
    case $yn in
        [Yy]* ) ssh $USER@best-linux.cs.wisc.edu "lpr print/${FILE} -P ${PRINTER} -# ${COPIES}"; echo "Print job added to queue"; break;;
        [Nn]* ) break;;
    esac
    echo -e "\n"
done

# cleanup 
echo -e "\n-----------------------"
echo "CLEANING UP AND EXITING"
echo "-----------------------"
ssh $USER@best-linux.cs.wisc.edu "rm -rf print"
