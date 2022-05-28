class Cocktail < ApplicationRecord

  validates :name,
  format: { with: /[a-zA-Z]+/, message: "invalid"  }

  validates :email,
  format: { with: /\w+@\w+\.\w+/, message: "invalid"  }

  def self.api(name)
    url = "https://cocktail-database-api.herokuapp.com/api/v1/cocktails/search?name=#{name}"
    URI.encode(url)
    url = RestClient.get(url)
    @data = JSON.parse(url)
    if @data != []
      return {name: @data[0]["name"], preparation: @data[0]["preparation"], ingredients: @data[0]["ingredients"], image: @data[0]["image"]}
    else
      return nil
    end
  end

end
