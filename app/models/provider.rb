class Provider < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :buy
  has_many :animals
end
