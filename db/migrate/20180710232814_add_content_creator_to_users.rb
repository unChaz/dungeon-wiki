class AddContentCreatorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :content_creator, :boolean
  end
end
