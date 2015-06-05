class Invoice < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :sell
  belongs_to :customer
end
