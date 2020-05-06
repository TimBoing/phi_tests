class Choice < ApplicationRecord
  belongs_to :previous_situation, :class_name => 'Situation'
  belongs_to :next_situation, :class_name => 'Situation', dependent: :destroy, optional: true
end

