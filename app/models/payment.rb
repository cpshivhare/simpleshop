class Payment < ApplicationRecord
  enum status: %i[inprogress pending ordered completed canceled]

  belongs_to :order
end
