class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.integer :animal_type_id, null:false
      t.string  :name,           null:false
      t.timestamps
    end
  end
end
