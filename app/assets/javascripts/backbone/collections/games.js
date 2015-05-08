App.Collections.Games = Backbone.Collection.extend({

  model = App.models.Game,

  BASE_URL = 'http://www.giantbomb.com/api/search/?api_key=a8165959ac6811840c5c0f9dea45105e96870a2e&format=json&query='

  searchURL = function(term) {
    return BASE_URL + encodeURI(term) + '@resources=game'

  },

  searchGame = function(term)
    url = URI.encode(BASE_URL + name + '&resources=game')
    # Utilize HTTParty to fetch the weather info for that city
    game_data = HTTParty.get(url)
    name = game_data["results"]["name"]
    synopsis = game_data["results"]["deck"]
    boxArt = game_data["results"]["image"][5]
  end



})