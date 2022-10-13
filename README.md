# KellerKind-Weather
## About The Project
kellerkind-weather is a cli to print the current local weather. For people who never leave the terminal.
kellerkind-weather uses a open weather api from <a href="https://open-meteo.com/">Weather data by Open-Meteo.com</a>.
## Getting Started
### Prequesitions
```
sudo apt get install jq
```

### Installation

1. **Download source code**: from the repository 
2. **Execute install.sh**:
	Input your City, latitude, longitude and language.
	```
	sudo ./install.sh
	```

3. **Export Path**:
	add the path export to your bash config (~/.bashrc or ~/.zshrc)
	```
	export PATH="/usr/local/keller_kind_weather/:$PATH" >> $HOME/{{yourBashRC}}
	```
4. **Create Alias**:
add an following alias to your bash config
	```
	alias kkw=weather.sh
	```
5. **Reload your bash**:
	```
	source ~/{{yourBashRC}}
	```

## Usage
by executing following command in your terminal you will get the current weather of your location
```
kkw
```
Example Response
```
Wheather in {{your City}}:
Clouds generally forming or developing with a temperature of 11.6 C°
```
## Roadmap
- wmo Codes =>
	- Multiple language
	- more unscientific weather description
- kkw t => weather tommorow
- kkw w	=> weather this week
## Links
- <a href="https://open-meteo.com/">Weather data by Open-Meteo.com</a>
