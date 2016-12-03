class Category < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => true

  has_many   :recipes,
             :dependent => :destroy

end
