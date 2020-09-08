class AddCardAttributesToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :set_info, :string
    add_column :cards, :pokemon, :boolean
    add_column :cards, :trainer, :boolean
    add_column :cards, :special_energy, :boolean
  end
end
