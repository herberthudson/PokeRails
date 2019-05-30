class PokemonsController < ApplicationController
  
  def view
    # pegando a temperatura
    @temp = get_temp
    # pegando o pokemon
    @pokemon = get_pokemon
    @perfil = PokeApi.get(pokemon: session[:pokemon].name)
  
  end

  private

  def get_pokemon    
    # Retorna o tipo do pokemon, caso ocorra erro, retorna false

    begin
      session[:pokemon] ||= {}
      list_of_pokemons = PokeApi.get(type: sort_pokemon)
    
      list_of_pokemons.pokemon.shuffle.each do |type|
        if type.pokemon.name != session[:pokemon]['name']
          session[:pokemon] = type.pokemon
          break
        end
      end
    
    rescue
      return false
    end

  end

  def sort_pokemon
    # Retorna um pokemon sortido de acordo com a temperatura
    
    # current temperature
    temp = get_temp
    if temp["weather"][0]["main"] == "Rain"
      session[:pokemon_type] = "electric"
      return "electric"
    else
      temp = get_temp["main"]["temp"]
      # infinity value
      inf = Float::INFINITY

      case
      when (-inf..5).include?(temp)
        # temp < 5
        pokemon_type = 'ice'
      when (5.0..9.99).include?(temp)
        # 5 <= temp < 10
        pokemon_type = 'water'
      when (12.01..14.99).include?(temp)
        # 12 < temp < 15
        pokemon_type = 'grass'
      when (15.01..20.99).include?(temp)
        # 15 < temp < 21
        pokemon_type = 'ground'
      when (23.01..26.99).include?(temp)
        # 23 < temp < 27
        pokemon_type = 'bug'
      when (27.01..33.99).include?(temp)
        # 27 < temp <= 33
        pokemon_type = 'rock'
      when (33.01..inf).include?(temp)
        # temp > 33
        pokemon_type = 'fire'
      else
        # pokemons normal
        pokemon_type = 'normal'
      end
      session[:pokemon_type] = pokemon_type
    end
    
  end

  def get_temp
    # Retorna a temperatura atual, caso occora erro, retorna false

    begin
      # get city name
      city = params[:city]
      # url for weather
      url = "http://api.openweathermap.org/data/2.5/weather"
      
      response = Faraday.get do |req| 
        req.url url , :q => city
        req.params['APPID'] = ENV['APPID']
        req.params['units'] = 'metric'
      end
      #parsing return
      temp = JSON.parse response.body
      
    rescue 
      return false
    end
    
  end

end
