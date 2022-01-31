class CreateUserRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_relations do |t|
      t.references :user
      t.integer :user2_id
      t.string :type

      t.timestamps
    end
  end
end
