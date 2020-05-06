class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.references :story
      t.string :description
      t.timestamps
    end
  end
end

