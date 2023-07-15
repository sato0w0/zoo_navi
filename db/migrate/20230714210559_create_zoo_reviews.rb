class CreateZooReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :zoo_reviews do |t|
      t.string  :title,   null:false
      t.text    :body,    null:false
      t.float   :rate,    null:false
      t.integer :user_id, null:false
      t.integer :zoo_id,  null:false
      t.timestamps
    end
  end
end
