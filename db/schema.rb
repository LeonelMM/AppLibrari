# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140704063851) do

  create_table "categories", force: true do |t|
    t.string   "nomcategoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "nombreCliente"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "rfc"
    t.string   "correo"
    t.string   "facebook"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "nombreCliente"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "RFC"
    t.string   "correo"
    t.string   "facebook"
    t.string   "linkedln"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.float    "preciounitario"
    t.integer  "cantidad"
    t.float    "importe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "fechaPedido"
    t.date     "fechaEntrega"
    t.date     "fechaEntregado"
    t.float    "importetotal"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "categorie_id"
    t.integer  "provider_id"
    t.string   "codigo"
    t.string   "nombre"
    t.string   "autor"
    t.string   "tema"
    t.string   "isbm"
    t.integer  "stock"
    t.float    "precio"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.string   "nombreCliente"
    t.date     "fecha"
    t.integer  "vendedor"
    t.string   "medioComunicacion"
    t.string   "promocion"
    t.string   "acuerdos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "Razonsocial"
    t.string   "telefono"
    t.string   "direccion"
    t.date     "fecha"
    t.string   "email"
    t.string   "rfc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_details", force: true do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.float    "preciounitario"
    t.integer  "cantidad"
    t.float    "importe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "customer_id"
    t.date     "fecha"
    t.float    "importe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
