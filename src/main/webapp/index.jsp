<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
    <!-- Import Bootstrap Icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Import CSS Files -->
    <link rel="stylesheet" href="./styles/style.css">
</head>
<body>
<div class="container">
    <div class="search-box">
        <i class="bi bi-geo-alt-fill"></i>
        <form action="hello-servlet" method="post" style="width: 100%;">
            <input type="text" name="city" placeholder="Enter your location" />
            <button type="submit" class="bi bi-search"></button>
        </form>
    </div>

    <div class="weather-box">
        <img src="https://www.freepik.com/free-ai-image/view-apocalyptic-dark-stormy-clouds_94166471.htm#query=dark%20clouds&position=13&from_view=keyword&track=ais_hybrid&uuid=f1d81bf8-fba6-450e-94c5-0e8cd8ef4bfb" alt="Weather Icon">
        <p class="temp">${temperature}<span>°C</span></p>
        <p class="description">${description}</p>
    </div>

    <div class="weather-details">
        <div class="humidity">
            <i class="bi bi-water"></i>
            <div class="text">
                <span>${humidity}%</span>
                <p>Humidity</p>
            </div>
        </div>

        <div class="wind">
            <i class="bi bi-wind"></i>
            <div class="text">
                <span>${wind_speed} km/h</span>
                <p>Wind Speed</p>
            </div>
        </div>

        <div class="pressure">
            <i class="bi bi-thermometer-half"></i>
            <div class="text">
                <span>${pressure_mb} mb</span>
                <p>Pressure</p>
            </div>
        </div>

        <div class="air-quality">
            <i class="bi bi-cloud-haze"></i>
            <div class="text">
                <span>${air_quality}</span>
                <p>Air Quality</p>
            </div>
        </div>

        <div class="last-updated">
            <i class="bi bi-clock"></i>
            <div class="text">
                <span>${lastUpdated}</span>
                <p>Last Updated</p>
            </div>
        </div>

        <div class="local-time">
            <i class="bi bi-calendar"></i>
            <div class="text">
                <span>${localtime}</span>
                <p>Local Time</p>
            </div>
        </div>
    </div>

    <div class="not-found">
        <img src="https://i.postimg.cc/C5436vMk/404.png" alt="404">
        <p>Oops! Location not found!</p>
    </div>
</div>
</body>
</html>
