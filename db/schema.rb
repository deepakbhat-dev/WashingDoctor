# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_06_110846) do

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "car_name", null: false
    t.string "registration_number", limit: 10, null: false
    t.string "size", limit: 10, null: false
    t.integer "wash_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["registration_number"], name: "index_cars_on_registration_number", unique: true
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone_number", limit: 10, null: false
    t.integer "wash_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone_number"], name: "index_customers_on_phone_number", unique: true
  end

  create_table "jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "car_id", null: false
    t.bigint "service_id", null: false
    t.string "feedback", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_jobs_on_car_id"
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
    t.index ["service_id"], name: "index_jobs_on_service_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "service_name", limit: 20, null: false
    t.string "car_size", limit: 10, null: false
    t.integer "price", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_name", "car_size"], name: "index_services_on_service_name_and_car_size", unique: true
  end

end
