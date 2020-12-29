class BillService < ApplicationRecord
  belongs_to :bill, optional: true
  belongs_to :service, optional: true
end