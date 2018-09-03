class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :campaign_id
      t.integer :armor_class
      t.timestamps
    end
  end
end
