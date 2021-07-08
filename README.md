# flutter_weather

Display weather forcast using JSON from openweather API-Pair Programming Project

Step 1: Create a weather class
Create a dart file to hold the weather classes:
We will download the 7-day weather forecast from OpenWeather's One Call API.   
We will use a shared API key of b15632ec4a9f1a874aeb15b3e22c4503
Here is a sample API call for Duluth: https://api.openweathermap.org/data/2.5/onecall?lat=46.8&lon=-92.1&exclude=hourly,current,minutely,alerts&units=imperial&appid=b15632ec4a9f1a874aeb15b3e22c4503
To view JSON in a nice format to analyze it: jsonformatter.org 
To generate Dart from JSON  we will use https://app.quicktype.io/
Pay attention to how the data for the 7-day forecast is stored.

Step 2: Get JSON weather data from OpenWeather API
Use the _getListItems() method from Monday's class as a starting point and add a similar method to your app to get the weather data.
We will use this URL for the Duluth weather: https://api.openweathermap.org/data/2.5/onecall?lat=46.8&lon=-92.1&exclude=hourly,current,minutely,alerts&units=imperial&appid=b15632ec4a9f1a874aeb15b3e22c4503
Define a List variable in the _MyHomePageState to hold the daily weather forecast
Override the initState() method and call your weather download method from it.

Step 3: Display weather text
In the ListView.builder,  change the itemCount: attribute so it is set to the number of days retrieved from the weather API.
Change the weatherTile widget so that it displays weather information for the day given by position.
Use the title: and subtitle: to display text for the weather
Remember you can combine variables with strings as "The high temperature will be ${_highTemp} today"

Step 4: Display weather icons
We will be using larger more colorful images from inconscout.com for the weather icons instead of those provided by OpenWeather.
Create a new weatherImage() Widget function to display the correct weather image and call this as the leading: parameter for the weatherTile.
Review the information provided in the daily weather and the options for the main description.  We will use the daily.weather[0].main to select the weather icon.
Review the weather images stored in the graphics folder.  Review the main descriptions for the weather.  In weatherImage() use an if-statement or case-statement as return the correct image.

Bonus Step 5: Use a Map for the images
In the function, use a map to define which images go with which weather descriptions.  For example:
final _imageMap = {
  "Clear": 'graphics/sun.png',
  "Clouds": 'graphics/cloud.png',
  "Rain": 'graphics/snow.png'};
Use this map instead of the if-statement or case-statement in your code
Submit:
Commit and push your completed code and submit a note that you are done.

## Getting Started

This project is a starting point for the Unit 14 Learning Activity.

A few resources:

- [Brightspace assignment](https://my.css.edu/d2l/le/content/16209/viewContent/475299/View?dst=1)
- [Completed version](https://github.com/tgibbons-css/flutter_weather)


