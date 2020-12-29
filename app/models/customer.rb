class Customer < ApplicationRecord
  belongs_to :company
  has_many :quotes, dependent: :destroy
  has_many :bills, dependent: :destroy
  
  validates :name, presence: { message: "Champ incorrect ou incomplet" }
  validates :address, presence: { message: "Champ incorrect ou incomplet" }
  validates :postcode, presence: { message: "Champ incorrect ou incomplet" }
  validates :city, presence: { message: "Champ incorrect ou incomplet" }
  validates :phone_1, presence: { message: "Champ incorrect ou incomplet" }
  validates :email_1, presence: { message: "Champ incorrect ou incomplet" }
end
