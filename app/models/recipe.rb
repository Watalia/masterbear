class Recipe < ApplicationRecord
  # Direct associations

  has_many   :combinations,
             :dependent => :destroy

  # Indirect associations

  has_many   :ingredients,
             :through => :combinations,
             :source => :ingredient

  belongs_to :category,
             :counter_cache => true



  # Validations

  validates :image, :presence => true

  validates :intructions, :presence => true

  validates :intructions, :length => { :minimum => 50 }

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
