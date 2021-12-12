require "http"
class FetchWeatherDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # open weather map
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather", params: {q: "Chiba", appid: "2317ceee5733cdc08bdedc91e7b815af"})
    p response.parse
  end
end
