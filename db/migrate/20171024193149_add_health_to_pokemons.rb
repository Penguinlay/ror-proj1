class AddHealthToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :health, :integer
  end
end
