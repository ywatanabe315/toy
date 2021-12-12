require "http"
class FetchWeatherDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # open weather map
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather", params: {q: "Chiba", appid: "2317ceee5733cdc08bdedc91e7b815af"})
    if response.status.success?
      Weather.create!(weather_params(response.parse))
    end
  end

  private

  def weather_params(res)
    {
      name: res["weather"].first["main"],
      description: res["weather"].first["description"],
      icon: res["weather"].first["icon"],
      location: res["name"],
      temp: res["main"]["temp"],
      temp_min: res["main"]["temp_min"],
      temp_max: res["main"]["temp_max"],
      pressure: res["main"]["pressure"],
      humidity: res["main"]["humidity"],
      wind_speed: res["wind"]["speed"]
    }
  end
end
