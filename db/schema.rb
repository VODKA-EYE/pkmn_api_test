# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_606_181_442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'abilities', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'abilities_characteristics', id: false, force: :cascade do |t|
    t.bigint 'characteristic_id', null: false
    t.bigint 'ability_id', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'characteristics', force: :cascade do |t|
    t.integer 'generation'
    t.float 'height'
    t.float 'weight'
    t.float 'gender_male'
    t.float 'gender_female'
    t.integer 'evolution_stage'
    t.bigint 'category_id'
    t.bigint 'ability_hidden_id'
    t.bigint 'color_id'
    t.bigint 'pokemon_types_id'
    t.bigint 'pokemon_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ability_hidden_id'], name: 'index_characteristics_on_ability_hidden_id'
    t.index ['category_id'], name: 'index_characteristics_on_category_id'
    t.index ['color_id'], name: 'index_characteristics_on_color_id'
    t.index ['pokemon_id'], name: 'index_characteristics_on_pokemon_id'
    t.index ['pokemon_types_id'], name: 'index_characteristics_on_pokemon_types_id'
  end

  create_table 'characteristics_pokemon_types', id: false, force: :cascade do |t|
    t.bigint 'characteristic_id', null: false
    t.bigint 'pokemon_type_id', null: false
  end

  create_table 'colors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pokemon_randoms', force: :cascade do |t|
    t.bigint 'pokemon_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pokemon_id'], name: 'index_pokemon_randoms_on_pokemon_id'
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
    t.string 'picture_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'stats_id'
    t.bigint 'characteristics_id'
    t.index ['characteristics_id'], name: 'index_pokemons_on_characteristics_id'
    t.index ['stats_id'], name: 'index_pokemons_on_stats_id'
  end

  create_table 'ratings', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'pokemon_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pokemon_id'], name: 'index_ratings_on_pokemon_id'
    t.index ['user_id'], name: 'index_ratings_on_user_id'
  end

  create_table 'stats', force: :cascade do |t|
    t.integer 'hp'
    t.integer 'attack'
    t.integer 'defence'
    t.integer 'sp_attack'
    t.integer 'sp_defence'
    t.integer 'speed'
    t.integer 'total'
    t.bigint 'pokemon_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pokemon_id'], name: 'index_stats_on_pokemon_id'
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

  add_foreign_key 'characteristics', 'abilities', column: 'ability_hidden_id'
  add_foreign_key 'characteristics', 'categories'
  add_foreign_key 'characteristics', 'colors'
  add_foreign_key 'characteristics', 'pokemon_types', column: 'pokemon_types_id'
  add_foreign_key 'ratings', 'pokemons'
  add_foreign_key 'ratings', 'users'
end
