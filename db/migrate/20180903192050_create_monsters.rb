class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.integer :encounter_id
      t.integer :armor_class
      t.string :monster_key
      t.string :name
      t.integer :initiative
      t.integer :hit_points
      t.timestamps
    end
  end
end
