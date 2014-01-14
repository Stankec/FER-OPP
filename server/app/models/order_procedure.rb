class OrderProcedure < ActiveRecord::Base
  belongs_to :order
  belongs_to :procedure
end
