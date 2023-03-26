# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_326_173_405) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'abilities', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'colors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'egg_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pokemon_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pokemons', force: :cascade do |t|
    t.string 'pokedex'
    t.string 'og_name'
    t.string 'name'
    t.string 'generation'
    t.string 'height'
    t.string 'weight'
    t.string 'gender_male'
    t.string 'gender_female'
    t.string 'gender_unknown'
    t.string 'egg_steps'
    t.string 'get_rate'
    t.string 'base_experience'
    t.string 'experience_type'
    t.string 'hp'
    t.string 'attack'
    t.string 'defence'
    t.string 'sp_attack'
    t.string 'sp_defence'
    t.string 'speed'
    t.string 'total'
    t.string 'picture_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'evolution_stage'
    t.bigint 'ability1_id'
    t.bigint 'ability2_id'
    t.bigint 'ability_hidden_id'
    t.bigint 'color_id'
    t.bigint 'egg_group1_id'
    t.bigint 'egg_group2_id'
    t.bigint 'type1_id'
    t.bigint 'type2_id'
    t.bigint 'category_id'
    t.index ['ability1_id'], name: 'index_pokemons_on_ability1_id'
    t.index ['ability2_id'], name: 'index_pokemons_on_ability2_id'
    t.index ['ability_hidden_id'], name: 'index_pokemons_on_ability_hidden_id'
    t.index ['category_id'], name: 'index_pokemons_on_category_id'
    t.index ['color_id'], name: 'index_pokemons_on_color_id'
    t.index ['egg_group1_id'], name: 'index_pokemons_on_egg_group1_id'
    t.index ['egg_group2_id'], name: 'index_pokemons_on_egg_group2_id'
    t.index ['type1_id'], name: 'index_pokemons_on_type1_id'
    t.index ['type2_id'], name: 'index_pokemons_on_type2_id'
  end

  create_table 'ratings', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'pokemon_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pokemon_id'], name: 'index_ratings_on_pokemon_id'
    t.index ['user_id'], name: 'index_ratings_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'token'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'pokemons', 'abilities', column: 'ability1_id'
  add_foreign_key 'pokemons', 'abilities', column: 'ability2_id'
  add_foreign_key 'pokemons', 'abilities', column: 'ability_hidden_id'
  add_foreign_key 'pokemons', 'categories'
  add_foreign_key 'pokemons', 'colors'
  add_foreign_key 'pokemons', 'egg_types', column: 'egg_group1_id'
  add_foreign_key 'pokemons', 'egg_types', column: 'egg_group2_id'
  add_foreign_key 'pokemons', 'pokemon_types', column: 'type1_id'
  add_foreign_key 'pokemons', 'pokemon_types', column: 'type2_id'
  add_foreign_key 'ratings', 'pokemons'
  add_foreign_key 'ratings', 'users'
end
