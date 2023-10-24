class WeatherApi {
 final  String cityName;
 final double temp;
 final String MainCondition;

 WeatherApi({
  required this.cityName,
  required this.temp,
  required this.MainCondition
 });

  factory WeatherApi.fromJson(Map<String, dynamic> json) =>WeatherApi(
    cityName: json ['name'],
     temp: json['main']['temp'].toDouble(),
      MainCondition: json['weather'][0]['main']);
}