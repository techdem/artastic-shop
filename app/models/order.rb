class Order < ApplicationRecord
  belongs_to :user
  
  def order_params
      
      params.required(:order).permit(:order_date, :user_id, :status)
      
  end
  
  def email
    user.email
  end
  
  def role
    user.role
  end
  
  has_many:orderitems
end
