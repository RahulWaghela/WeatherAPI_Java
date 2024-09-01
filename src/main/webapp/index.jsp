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
    <link rel="stylesheet" href="css/style.css">

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #000; /* Black background */
            background-image: url('./images/img.jpg'); /* Local image */
            background-size: cover;
            background-position: center;
            color: #fff; /* White text for contrast */
        }

        .container {
            position: relative;
            width: 100%;
            max-width:1231px; /* Adjust as needed */
            height: 100%;
            max-height: 700px; /* Adjust as needed */
            background: linear-gradient(250deg, #fdd70069, #154f95be);
            backdrop-filter: blur(30px);
            border: 2px solid lightcyan;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            overflow: hidden; /* Ensure content does not overflow */
        }

        .search-box {
            width: 100%;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-box i {
            font-size: 20px;
            color: #fff;
        }

        .search-box input {
            flex: 1;
            height: 40px;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            outline: none;
            font-size: 16px;
            color: #fff;
            padding: 0 10px;
        }

        .search-box button {
            width: 40px;
            height: 40px;
            background: transparent;
            border: none;
            font-size: 20px;
            color: #fff;
            cursor: pointer;
        }

        .weather-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .weather-box img {
            width: 60%;
            max-width: 150px; /* Limit the image size */
            margin-bottom: 10px;
        }

        .weather-box .temp {
            font-size: 48px;
            margin: 10px 0;
        }

        .weather-box .description {
            font-size: 20px;
        }

        .weather-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            width: 100%;
        }

        .weather-details div {
            display: flex;
            align-items: center;
            margin: 5px 0;
            width: 48%;
        }

        .weather-details i {
            font-size: 24px;
            margin-right: 10px;
        }

        .weather-details span {
            font-size: 18px;
            margin-right: 10px;
        }

        .weather-details p {
            font-size: 14px;
            margin: 0;
        }

        .not-found {
            display: none;
            text-align: center;
            margin-top: 20px;
        }

        .not-found img {
            width: 60%;
            max-width: 150px; /* Limit the image size */
        }

    </style>
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
