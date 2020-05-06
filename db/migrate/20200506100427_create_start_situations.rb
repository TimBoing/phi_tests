class CreateStartSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :start_situations do |t|
      t.references :story
      t.references :situation
      t.timestamps
    end
  end
end

