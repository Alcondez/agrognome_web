class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :sells
  has_many :buys
  has_many :customers
  has_many :providers
  has_many :paddocks
  has_many :animals
  has_many :invoices
  has_one :profile

end
