#!/bin/bash
ConfigFilePath=/usr/local/etc/keller_kind_weather/myConfig.json
WeatherCodeFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")";cd .. ; pwd -P )/data/wmo_codes.json
Config=""
if [ -s $ConfigFilePath ];
then
	Config=$( cat $ConfigFilePath )
else
	echo config file doesn t  exists
fi
Lat=$( echo $Config| jq '. |.lat')
Lon=$( echo $Config| jq '. |.lon')
City=$( echo $Config| jq -r '. |.city.name')
Lang=$( echo $Config| jq -r '. |.lang')
if [ -z "$Config" ];
then
	echo config file is empty
fi

CurrentWeatherJSON=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$Lat&longitude=$Lon&current_weather=true"| jq '. | {current_weather}')
WeatherCode=$( echo $CurrentWeatherJSON| jq '.current_weather.weathercode');
if [ -s $WeatherCodeFilePath ];
then
	LangWCode=$( cat $WeatherCodeFilePath|jq -r '. |.lang.'$Lang'."'$WeatherCode'".description')
else
	echo Weather code file error
fi
echo -e "Weather in $City:\n$LangWCode with a temperature of $(echo $CurrentWeatherJSON|jq '.current_weather.temperature') C°"
