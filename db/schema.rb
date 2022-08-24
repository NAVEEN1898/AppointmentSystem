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

ActiveRecord::Schema.define(version: 20_220_810_123_216) do
  create_table 'appointments', force: :cascade do |t|
    t.integer 'counsellar_id'
    t.integer 'customer_id'
    t.datetime 'appointment_date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'advice'
  end

  create_table 'feedbacks', force: :cascade do |t|
    t.string 'description'
    t.integer 'counsellar_id'
    t.integer 'customer_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'services', force: :cascade do |t|
    t.string 'service_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id', null: false
    t.datetime 'time'
    t.index ['user_id'], name: 'index_services_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password'
    t.integer 'user_type', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
  end

  add_foreign_key 'services', 'users'
end
