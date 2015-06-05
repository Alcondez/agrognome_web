class Paddock < ActiveRecord::Base
  belongs_to :usuario
  has_many :animals
end
