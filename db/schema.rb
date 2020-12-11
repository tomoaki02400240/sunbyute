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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_12_03_032230) do
=======
ActiveRecord::Schema.define(version: 2020_11_18_151437) do
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "product_image"
    t.bigint "shop_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shop_descs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "description"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_descs_on_shop_id"
=======
  create_table "shop_avatars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.text "content"
    t.index ["shop_id"], name: "index_shop_avatars_on_shop_id"
  end

  create_table "shop_contents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_contents_on_shop_id"
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.bigint "city_id"
    t.string "shop_img"
    t.index ["city_id"], name: "index_shops_on_city_id"
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["prefecture_id"], name: "index_shops_on_prefecture_id"
  end

  add_foreign_key "cities", "prefectures"
<<<<<<< HEAD
  add_foreign_key "products", "shops"
  add_foreign_key "shop_descs", "shops"
=======
  add_foreign_key "shop_avatars", "shops"
  add_foreign_key "shop_contents", "shops"
>>>>>>> 1dc7385d28732438a05c4f5d553bec4f306a5f4e
  add_foreign_key "shops", "cities"
  add_foreign_key "shops", "prefectures"
end
