class AddProfilePicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profilePic, :string
  end
end
