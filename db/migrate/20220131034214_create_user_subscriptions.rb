class CreateUserSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subscriptions do |t|

      t.references :user
      t.references :podcast
      t.integer :podcast_rating
      
      t.timestamps
    end
  end
end
