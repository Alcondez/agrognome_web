class Animal < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :paddock
  belongs_to :provider
end
