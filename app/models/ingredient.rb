class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :combinations,
             :dependent => :destroy

  # Indirect associations

  has_many   :recipes,
             :through => :combinations,
             :source => :recipe

  # Validations

  validates :name, :presence => true

end
