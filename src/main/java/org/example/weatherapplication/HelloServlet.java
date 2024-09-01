    package org.example.weatherapplication;
    
    import java.io.*;
    import java.net.HttpURLConnection;
    import java.net.URL;
    import java.util.Scanner;
    
    import com.google.gson.Gson;
    import com.google.gson.JsonObject;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;
    
    @WebServlet(name = "helloServlet", value = "/hello-servlet")
    public class HelloServlet extends HttpServlet {
        private static final String API_KEY = "493164eef12c45638a970943240109";
    
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String city = req.getParameter("city");
            String apiUrl = String.format("http://api.weatherapi.com/v1/current.json?key=%s&q=%s&aqi=yes", API_KEY, city);
    
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
    
            InputStream inputStream = connection.getInputStream();
            InputStreamReader reader = new InputStreamReader(inputStream);
    
            StringBuilder response = new StringBuilder();
            Scanner scanner = new Scanner(reader);
            while (scanner.hasNext()) {
                response.append(scanner.nextLine());
            }
            scanner.close();

//            converting into json to extract the detail .
            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(response.toString(), JsonObject.class);
            JsonObject location = jsonObject.getAsJsonObject("location"); //extract location related detail
            JsonObject current = jsonObject.getAsJsonObject("current");

            String country = location.get("country").getAsString();
            String region = location.get("region").getAsString();
            String cityName = location.get("name").getAsString();
            String localtime = location.get("localtime").getAsString();
            double temperature = current.get("temp_c").getAsDouble();
            double humidity = current.get("humidity").getAsDouble();
            String lastUpdated = current.get("last_updated").getAsString();

            double pressureMb = current.has("pressure_mb") ? current.get("pressure_mb").getAsDouble() : 0.0;
            String windDir = current.has("wind_dir") ? current.get("wind_dir").getAsString() : "N/A";
            String airQuality = current.has("air_quality") ? current.getAsJsonObject("air_quality").toString() : "N/A";

            req.setAttribute("country", country);
            req.setAttribute("region", region);
            req.setAttribute("city", cityName);
            req.setAttribute("localtime", localtime);
            req.setAttribute("pressure_mb", pressureMb);
            req.setAttribute("wind_dir", windDir);
            req.setAttribute("air_quality", airQuality);
            req.setAttribute("temperature", temperature);
            req.setAttribute("humidity", humidity);
            req.setAttribute("lastUpdated", lastUpdated);
            System.out.println(country);
            System.out.println(region);
            System.out.println(cityName);
            System.out.println(localtime);
            System.out.println(pressureMb);
            System.out.println(windDir);
            System.out.println(airQuality);
            System.out.println(temperature);
            System.out.println(humidity);
            System.out.println(lastUpdated);

           connection.disconnect();
           req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
