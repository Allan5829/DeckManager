class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :count #deck validation purposes
      t.boolean :basic_energy #deck validation purposes
 
      t.timestamps
    end
  end
end
