class Situation < ApplicationRecord
  belongs_to :story

  has_many :child_choices, :class_name => 'Choice', :foreign_key => 'previous_situation_id', dependent: :destroy
  has_one :parent_choice, :class_name => 'Choice', :foreign_key => 'next_situation_id'

  has_one :start_situation

end


