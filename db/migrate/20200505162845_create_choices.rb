class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :description

      t.references :previous_situation
      t.references :next_situation

      t.timestamps
    end

    add_foreign_key :choices, :situations, column: :previous_situation_id, primary_key: :id
    add_foreign_key :choices, :situations, column: :next_situation_id, primary_key: :id
  end
end


