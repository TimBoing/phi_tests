class Story < ApplicationRecord
  has_many :situations, dependent: :destroy
  has_one :start_situation

end


