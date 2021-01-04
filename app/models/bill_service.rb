class BillService < ApplicationRecord
  belongs_to :bill, optional: true
  belongs_to :service, dependent: :destroy
end