class Orderitem < ApplicationRecord
  belongs_to :order   # Order items belong to an order

end
