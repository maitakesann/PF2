class CreateRelationships < ActiveRecord::Migration[5.2]
   def change
      create_table :relationships do |t|
        t.references :user, foreign_key: true
        t.references :follow, foreign_key: { to_table: :users }
        
        t.integer :follower_id
        t.integer :following_id

        t.timestamps
        
      
       t.index [:user_id, :follow_id], unique: true
     end
   end
end
