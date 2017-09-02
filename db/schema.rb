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

ActiveRecord::Schema.define(version: 20170827090914) do

  create_table "attempts", force: :cascade do |t|
    t.integer  "total_marks",    limit: 4
    t.integer  "require_marks",  limit: 4
    t.date     "attempted_date"
    t.integer  "student_id",     limit: 4
    t.integer  "paper_id",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "attempts", ["paper_id"], name: "index_attempts_on_paper_id", using: :btree
  add_index "attempts", ["student_id"], name: "index_attempts_on_student_id", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.string   "chapter_name",        limit: 255
    t.text     "chapter_discription", limit: 65535
    t.integer  "subject_id",          limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "chapters", ["subject_id"], name: "index_chapters_on_subject_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.string   "data_fingerprint",  limit: 255
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "exams", force: :cascade do |t|
    t.string   "exam_name",         limit: 255
    t.date     "exam_date"
    t.text     "exam_discription",  limit: 65535
    t.text     "exam_instructions", limit: 65535
    t.integer  "level_id",          limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "type_of_exam",      limit: 255
  end

  add_index "exams", ["level_id"], name: "index_exams_on_level_id", using: :btree

  create_table "exams_students", force: :cascade do |t|
    t.integer  "exam_id",    limit: 4
    t.integer  "student_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "exams_students", ["exam_id"], name: "index_exams_students_on_exam_id", using: :btree
  add_index "exams_students", ["student_id"], name: "index_exams_students_on_student_id", using: :btree

  create_table "exams_subjects", force: :cascade do |t|
    t.integer  "exam_id",    limit: 4
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "exams_subjects", ["exam_id"], name: "index_exams_subjects_on_exam_id", using: :btree
  add_index "exams_subjects", ["subject_id"], name: "index_exams_subjects_on_subject_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "duration",      limit: 4
    t.time     "start_time"
    t.time     "end_time"
    t.text     "level_remarks", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "days_of_week",  limit: 255
  end

  create_table "levels_students", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "level_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "levels_students", ["level_id"], name: "index_levels_students_on_level_id", using: :btree
  add_index "levels_students", ["student_id"], name: "index_levels_students_on_student_id", using: :btree

  create_table "levels_teachers", force: :cascade do |t|
    t.integer  "level_id",   limit: 4
    t.integer  "teacher_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "levels_teachers", ["level_id"], name: "index_levels_teachers_on_level_id", using: :btree
  add_index "levels_teachers", ["teacher_id"], name: "index_levels_teachers_on_teacher_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "option_name",  limit: 255
    t.boolean  "option_right"
    t.integer  "question_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "attempt_id",   limit: 4
  end

  add_index "options", ["attempt_id"], name: "index_options_on_attempt_id", using: :btree
  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "papers", force: :cascade do |t|
    t.time     "exam_time"
    t.string   "paper_name",         limit: 255
    t.boolean  "attempt_flag"
    t.boolean  "current_paper_flag"
    t.integer  "exam_id",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "papers", ["exam_id"], name: "index_papers_on_exam_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "question_name",        limit: 255
    t.text     "question_discription", limit: 65535
    t.integer  "paper_id",             limit: 4
    t.integer  "subject_id",           limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "assking_question",     limit: 65535
    t.string   "type_of_question",     limit: 255
  end

  add_index "questions", ["paper_id"], name: "index_questions_on_paper_id", using: :btree
  add_index "questions", ["subject_id"], name: "index_questions_on_subject_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.string   "mobile",      limit: 255
    t.string   "address_one", limit: 255
    t.string   "address_two", limit: 255
    t.string   "state",       limit: 255
    t.string   "city",        limit: 255
    t.integer  "pin",         limit: 4
    t.boolean  "accept_flag"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "get_marks",     limit: 4
    t.integer  "total_marks",   limit: 4
    t.string   "result_status", limit: 255
    t.integer  "min_marks",     limit: 4
    t.integer  "attempt_id",    limit: 4
    t.integer  "student_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "results", ["attempt_id"], name: "index_results_on_attempt_id", using: :btree
  add_index "results", ["student_id"], name: "index_results_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name",                             limit: 255
    t.string   "last_name",                              limit: 255
    t.string   "mid_name",                               limit: 255
    t.string   "gender",                                 limit: 255
    t.date     "date_of_birth"
    t.string   "mobile_number",                          limit: 255
    t.string   "email",                                  limit: 255
    t.string   "address_one",                            limit: 255
    t.string   "address_two",                            limit: 255
    t.string   "address_three",                          limit: 255
    t.string   "city",                                   limit: 255
    t.string   "state",                                  limit: 255
    t.integer  "pin",                                    limit: 4
    t.string   "occupation",                             limit: 255
    t.string   "qualification",                          limit: 255
    t.string   "have_you_completed_any_computer_cource", limit: 255
    t.string   "course_name",                            limit: 255
    t.string   "computer_literacy_level",                limit: 255
    t.string   "percentages_of_blindness",               limit: 255
    t.string   "which_assistive_technology_do_you_use",  limit: 255
    t.string   "do_you_have_membership_of_nfbmpune",     limit: 255
    t.boolean  "tirms"
    t.integer  "user_id",                                limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "current_level",                          limit: 4
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name",        limit: 255
    t.text     "subject_discription", limit: 65535
    t.integer  "level_id",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "subjects", ["level_id"], name: "index_subjects_on_level_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.string   "gender",                   limit: 255
    t.date     "date_of_birth"
    t.string   "mobile_number",            limit: 255
    t.string   "email",                    limit: 255
    t.string   "listening_skills_jaws",    limit: 255
    t.string   "writing_skills_with_jaws", limit: 255
    t.text     "strengths",                limit: 65535
    t.text     "weaknesses",               limit: 65535
    t.boolean  "tirms"
    t.integer  "user_id",                  limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "role",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attempts", "papers"
  add_foreign_key "attempts", "students"
  add_foreign_key "chapters", "subjects"
  add_foreign_key "exams", "levels"
  add_foreign_key "exams_students", "exams"
  add_foreign_key "exams_students", "students"
  add_foreign_key "exams_subjects", "exams"
  add_foreign_key "exams_subjects", "subjects"
  add_foreign_key "levels_students", "levels"
  add_foreign_key "levels_students", "students"
  add_foreign_key "levels_teachers", "levels"
  add_foreign_key "levels_teachers", "teachers"
  add_foreign_key "options", "attempts"
  add_foreign_key "options", "questions"
  add_foreign_key "papers", "exams"
  add_foreign_key "questions", "papers"
  add_foreign_key "questions", "subjects"
  add_foreign_key "results", "attempts"
  add_foreign_key "results", "students"
  add_foreign_key "students", "users"
  add_foreign_key "subjects", "levels"
  add_foreign_key "teachers", "users"
end
