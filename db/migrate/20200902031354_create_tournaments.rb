class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :event_name
      t.string :event_date
      t.boolean :finished #for admins to say when the tournament object is completed
      t.string :info

      t.timestamps
    end
  end
end
