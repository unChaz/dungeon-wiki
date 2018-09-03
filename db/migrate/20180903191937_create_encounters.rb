class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.integer :location_id
      t.integer :campaign_id
      t.string :name
      t.timestamps
    end
  end
end
