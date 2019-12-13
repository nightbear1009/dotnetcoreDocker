docker build -t a dotnetDocker

docker run -p 5001:80 dotnetDocker

curl http://localhost:5001/WeatherForecast