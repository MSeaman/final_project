class Game < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :ratings

  def self.search(query) 
    response = HTTParty.get("http://www.giantbomb.com/api/search/?api_key=a8165959ac6811840c5c0f9dea45105e96870a2e&format=json&query=#{URI.escape(query)}&resources=game")
    parsed_response = JSON.parse(response.body)
    games = parsed_response["results"] || []
    # games.map {|game| game['deck']}
  end

  def self.game(id)
    response = HTTParty.get("http://www.giantbomb.com/api/game/3030-#{URI.escape(id)}/?api_key=a8165959ac6811840c5c0f9dea45105e96870a2e&format=json")
    parsed_response = JSON.parse(response)
    Game.new(
    name: parsed_response["name"] || 'unknown',
    synopsis: parsed_response["deck"] || 'unknown',
    boxArt: parsed_response["image"][5] || 'unknowm'
    )
  end

end