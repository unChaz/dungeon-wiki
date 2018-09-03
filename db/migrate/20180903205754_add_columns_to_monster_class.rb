class AddColumnsToMonsterClass < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_classes, :hit_dice, :string
    add_column :monster_classes, :speed, :string
    add_column :monster_classes, :strength, :integer
    add_column :monster_classes, :dexterity, :integer
    add_column :monster_classes, :constitution, :integer
    add_column :monster_classes, :intelligence, :integer
    add_column :monster_classes, :wisdom, :integer
    add_column :monster_classes, :charisma, :integer
    add_column :monster_classes, :stealth, :integer
    add_column :monster_classes, :damage_vulnerabilities, :string
    add_column :monster_classes, :damage_resistances, :string
    add_column :monster_classes, :damage_immunities, :string
    add_column :monster_classes, :condition_immunities, :string
    add_column :monster_classes, :senses, :string
    add_column :monster_classes, :languages, :string
    add_column :monster_classes, :special_abilities, :text, array: true, default: []
    add_column :monster_classes, :url, :string
  end
end
