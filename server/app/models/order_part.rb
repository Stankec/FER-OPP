class OrderPart < ActiveRecord::Base
  belongs_to :order
  belongs_to :part
end
