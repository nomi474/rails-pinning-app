class CreateUsers < ActiveRecord::Migration
  def self.down
	remove_column :users, :string
  end
end
