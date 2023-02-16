class AddEvolutionsToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :evolution_stage, :integer
  end
end
