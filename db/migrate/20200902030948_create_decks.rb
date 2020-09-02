class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :title
      t.string :description
      t.boolean :shared
      t.string :player_name #use by admin only
      t.integer :tournament_id #use by admin only
      t.integer :tournament_placement #use by admin only

      t.timestamps
    end
  end
end
