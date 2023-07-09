class CreateZooAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :zoo_animals do |t|
      t.integer  :zoo_id,    null:false
      t.integer  :animal_id, null:false
      t.timestamps
    end
  end
end
