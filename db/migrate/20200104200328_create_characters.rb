class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :player_name
      t.string :campaign
      t.string :character_name
      t.string :character_class
      t.integer :armor_class
      t.integer :perception
      t.integer :investigation
      t.integer :insight
      t.integer :spell_save_dc
      t.string :user_id
    end
  end
end
