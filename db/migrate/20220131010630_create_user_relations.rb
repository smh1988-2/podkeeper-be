class CreateUserRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_relations do |t|
      t.references :user, foreign_key: true
      t.references :user2, foreign_key: { to_table: "users"}
      t.string :rel_type

      t.timestamps
    end
  end
end
