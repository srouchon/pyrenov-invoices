class Company < ApplicationRecord
  belongs_to :user
  has_many :customers, dependent: :destroy
  has_many :quotes, through: :customers
  has_many :bills, through: :customers
  has_many :services, dependent: :destroy

  validates :name, presence: { message: "Champ incorrect ou incomplet" }
  validates :address, presence: { message: "Champ incorrect ou incomplet" }
  validates :postcode, presence: { message: "Champ incorrect ou incomplet" }
  validates :city, presence: { message: "Champ incorrect ou incomplet" }
  validates :phone, presence: { message: "Champ incorrect ou incomplet" }
  validates :email, presence: { message: "Champ incorrect ou incomplet" }
  validates :siret, presence: { message: "Champ incorrect ou incomplet" }
  validates :siret, presence: { message: "Champ incorrect ou incomplet" }
  validates :tva, presence: { message: "Champ incorrect ou incomplet" }
  
  def nb_quotes
    self.quotes.count
  end
  
  def nb_bills
    self.bills.count
  end
  
  def nb_quotes_per_customer(customer)
    self.quotes.where(customer: customer).count
  end
  
  def nb_bills_per_customer(customer)
    self.bills.where(customer: customer).count
  end
end
