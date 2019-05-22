#!/bin/bash
set -x
build_path=/home/user/jenkins/workspace/Dashboard_Development_Build

cd $build_path/ApplicationServer

# this will transpile the typescript code to javascript code in /dist folder

tsc

# go to the applicationUI dir

cd $build_path/ApplicationUI

# this will transpile the angular application to javascript and minify the files for production mode build in /dis/ui folder

ng build -–prod


if [$? -ne 0];then
	echo "Compilation successfull and proceeding with Build process"
else
	echo "Compilation failed, exited from this script"
exit 0

# Changing directory to ApplicationServer path

cd $build_path/ApplicationServer

# Copy  content of ApplicationServer/dist folder inside app folder 

cp -r ./dist/* ../build/app/

# Copy ‘node_modules’ and ‘floorplans’ folder from ApplicationServer to app folder

cp -r node_modules floorplans ../build/app/

# Copy ‘appCpnfig.json’ file from ApplicationServer  to the build folder

cp appConfig.json ../build/

# Change directory to app

cd ../build/app

# Run node index.js 

node index.js
