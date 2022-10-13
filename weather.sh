#!/bin/bash
FetchWeatherFilePath=$( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )
$FetchWeatherFilePath/scripts/fetchWeather.sh
