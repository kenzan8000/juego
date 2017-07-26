class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.integer :language_set_id
      t.string :text_in
      t.string :text_out

      t.timestamps
    end
  end
end
