class WeatherIconMapper {
  static const Map<int, String> wmoToSvg = {
    0: 'sun.svg', // Clear sky
    1: 'sun_cloud.svg', // Mainly clear
    2: 'sun_cloud.svg', // Partly cloudy
    3: 'cloud.svg', // Overcast
    45: 'fog.svg', // Fog
    48: 'fog.svg', // Depositing rime fog
    51: 'cloud_rain_light.svg', // Drizzle: Light intensity
    53: 'cloud_rain_medium.svg', // Drizzle: Moderate intensity
    55: 'cloud_rain_heavy.svg', // Drizzle: Dense intensity
    56: 'cloud_rain_light.svg', // Freezing Drizzle: Light intensity
    57: 'cloud_rain_heavy.svg', // Freezing Drizzle: Dense intensity
    61: 'cloud_rain_light.svg', // Rain: Slight intensity
    63: 'cloud_rain_medium.svg', // Rain: Moderate intensity
    65: 'cloud_rain_heavy.svg', // Rain: Heavy intensity
    66: 'cloud_rain_light.svg', // Freezing Rain: Light intensity
    67: 'cloud_rain_heavy.svg', // Freezing Rain: Heavy intensity
    71: 'cloud_snowing.svg', // Snow fall: Slight intensity
    73: 'cloud_snowing.svg', // Snow fall: Moderate intensity
    75: 'cloud_snowing.svg', // Snow fall: Heavy intensity
    77: 'snowflake.svg', // Snow grains
    80: 'cloud_rain_light.svg', // Rain showers: Slight intensity
    81: 'cloud_rain_medium.svg', // Rain showers: Moderate intensity
    82: 'cloud_rain_heavy.svg', // Rain showers: Violent intensity
    85: 'cloud_snowing.svg', // Snow showers: Slight intensity
    86: 'cloud_snowing.svg', // Snow showers: Heavy intensity
    95: 'lightning.svg', // Thunderstorm: Slight or moderate
    96: 'cloud_lightning_waterdrop.svg', // Thunderstorm with slight hail
    99: 'rain_stones.svg', // Thunderstorm with heavy hail
  };

  static const String weatherIconsPath = 'assets/weather_icons';

  static String getSvgFilePath(int wmoCode) {
    if (wmoToSvg[wmoCode] != null) {
      return '$weatherIconsPath/${wmoToSvg[wmoCode]!}';
    }
    return '$weatherIconsPath/warning.svg';
  }
}
