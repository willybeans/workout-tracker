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

ActiveRecord::Schema[8.0].define(version: 2026_04_21_015052) do
  create_table "exercises", force: :cascade do |t|
    t.integer "reps"
    t.string "type"
    t.string "self_report"
    t.integer "intensity"
    t.string "name"
    t.integer "duration_seconds"
    t.boolean "completed", default: false
    t.boolean "skipped", default: false
    t.boolean "show_timer", default: false
    t.integer "default_timer_interval_seconds"
    t.boolean "show_metronome", default: false
    t.integer "bpm"
    t.integer "workout_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "bio"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_goals", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "title"
    t.text "intention"
    t.boolean "started"
    t.boolean "ended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_schedules", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "time"
    t.string "type"
    t.integer "duration_seconds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercises", "workouts"
end
