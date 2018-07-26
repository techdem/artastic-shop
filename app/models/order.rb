class Order < ApplicationRecord
  belongs_to :user
  
  def order_params
      
      params.required(:order).permit(:order_date, :user_id, :status)
      
  end
  
  def email   # Define method to get email of user from an order
    user.email
  end
  
  def role    # Define method to get role of user from an order
    user.role
  end
  
  has_many:orderitems, :dependent => :destroy   # Order items must also be removed from the database
end
