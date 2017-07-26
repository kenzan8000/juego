class CreateLanguageSets < ActiveRecord::Migration[5.0]
  def change
    create_table :language_sets do |t|
      t.integer :language_in_id
      t.integer :language_out_id

      t.timestamps
    end
  end
end
