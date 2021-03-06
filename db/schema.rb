# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170210195150) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "endereco"
    t.string   "sexo",            limit: 1
    t.string   "email"
    t.string   "uf",              limit: 2
    t.string   "cidade"
    t.string   "pais"
    t.string   "cep",             limit: 8
    t.date     "data_nascimento"
    t.boolean  "newsletter"
  end

  create_table "produto_tipos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.decimal  "valor",      precision: 8, scale: 2
    t.integer  "estoque"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "tipo_id"
    t.string   "image"
    t.index ["tipo_id"], name: "index_produtos_on_tipo_id"
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
