class AddNotesToUserDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :user_decks, :notes, :string
  end
end
