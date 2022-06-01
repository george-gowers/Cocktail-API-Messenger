class Drink < ApplicationRecord

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :preparation, presence: true
  validates :image, presence: true


end
