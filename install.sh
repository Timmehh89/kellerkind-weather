#!/bin/bash
SourcePath=$( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )
ExampleConfigFilePath=$SourcePath/config/example_config.json
#echo $ExampleConfigFilePath
echo Install KellerKind Weather

# check jq
echo -n "Checking dependencies... "
if command -v jq>/dev/null >&2>&1;then
	echo "ok"
else
	echo -e "\njq needs to be installed. Use 'sudo apt-get install jq' to install jq."
	exit 1;
fi


# choose city
echo Enter city
read CITY

# set Lat and Long
echo Enter latitude
read LAT
echo Enter longitude
read LON

# set Language
echo Enter language
read LAN
CONFIG_JSON=$(cat $ExampleConfigFilePath|sed -E 's/\{\{LAT\}\}/'$LAT'/g' |sed -E 's/\{\{LON\}\}/'$LON'/g' |sed -E 's/\{\{LANGUAGE\}\}/'$LAN'/g'|sed -E 's/\{\{CITY\}\}/'$CITY'/g'  )
# echo $CONFIG_JSON

# create Config
mkdir /usr/local/etc/keller_kind_weather
echo $CONFIG_JSON > /usr/local/etc/keller_kind_weather/myConfig.json
# install
mkdir /usr/local/keller_kind_weather

# copy weather.sh
cp $SourcePath/weather.sh /usr/local/keller_kind_weather/

# copy scripts
cp -r $SourcePath/scripts /usr/local/keller_kind_weather/ 
# copy data
cp -r $SourcePath/data /usr/local/keller_kind_weather/

# check SHELL

# export Path

# create alias
# check zshrc
# check bashrc

