class RemoveDescriptionFromDecks < ActiveRecord::Migration[5.2]
  def change
    remove_column :decks, :description, :string
  end
end
