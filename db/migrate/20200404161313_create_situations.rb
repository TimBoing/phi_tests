class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.string :description
      t.string :choice_a
      t.string :choice_b
      t.string :choice_a_id
      t.string :choice_b_id
      t.string :previous_situation_id
      t.timestamps
    end
  end
end
