class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|
      t.string   :name,             null:false
      t.text     :description,      null:false
      t.string   :region,           null:false
      t.string   :address,          null:false
      t.string   :opening_hours,    null:false
      t.string   :closing_day,      null:false
      t.string   :admission,        null:false
      t.string   :telephone_number, null:false
      t.timestamps
    end
  end
end
