class UserMailer < ApplicationMailer

  def recipe(hash, email)
    @name = hash[:name]
    @preparation = hash[:preparation]
    @ingredients = hash[:ingredients]
    @image = hash[:image]
    @email = email
    mail(to: "#{email}", subject: 'Cocktail Recipe')
  end

end
