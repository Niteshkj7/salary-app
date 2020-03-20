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

ActiveRecord::Schema.define(version: 2020_03_17_125303) do

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "gender"
    t.text "address"
    t.date "joining_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.string "leave_type"
    t.date "leave_date"
    t.integer "leave_balance"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leaves_on_employee_id"
  end

  create_table "rails", force: :cascade do |t|
    t.string "generate"
    t.string "scaffold"
    t.string "SalaryHead"
    t.string "head_name"
    t.boolean "earning"
    t.boolean "deduction"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_rails_on_employee_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.decimal "total_salary"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salaries_on_employee_id"
  end

  create_table "salary_allotments", force: :cascade do |t|
    t.decimal "basic"
    t.decimal "hra"
    t.decimal "da"
    t.decimal "income_tax"
    t.decimal "state_tax"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salary_allotments_on_employee_id"
  end

  create_table "salary_heads", force: :cascade do |t|
    t.string "head_name"
    t.boolean "earning"
    t.boolean "deduction"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salary_heads_on_employee_id"
  end

end
