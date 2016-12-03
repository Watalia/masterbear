class Recipe < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :image, :presence => true

  validates :intructions, :presence => true

  validates :intructions, :length => { :minimum => 50 }

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
