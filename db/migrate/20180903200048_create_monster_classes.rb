class CreateMonsterClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_classes do |t|
      t.string :name
      t.string :foreign_key
      t.integer :armor_class
      t.integer :max_hit_points
      t.decimal :challenge_rating
      t.timestamps
    end
  end
end
