class Ingredient < ApplicationRecord
  # Direct associations

  has_many   :combinations,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
