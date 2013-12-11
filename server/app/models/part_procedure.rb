class PartProcedure < ActiveRecord::Base
  belongs_to :part
  belongs_to :procedure
end
