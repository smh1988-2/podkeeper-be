class CreateUserActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :user_activities do |t|

      t.references :user
      t.references :episodes
      t.references :podcast

      t.string :activity_type
      t.integer :rating
      t.string :review
      t.string :status
      
      t.timestamps
    end
  end
end
