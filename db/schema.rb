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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121210174901) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                              :null => false
    t.string   "aasm_status",     :default => "draft", :null => false
    t.text     "preview"
    t.boolean  "delta",           :default => true,    :null => false
    t.integer  "position",        :default => 0
    t.boolean  "publish_on_main"
  end

  add_index "articles", ["aasm_status"], :name => "index_articles_on_status"
  add_index "articles", ["category_id"], :name => "index_articles_on_category_id"
  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "position"
    t.integer "articles_count", :default => 0, :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.text     "body",             :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "hidden",           :default => false, :null => false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.boolean  "shown",           :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publish_on_main"
    t.integer  "position"
  end

  create_table "recipe_categories", :force => true do |t|
    t.string  "name"
    t.integer "position"
    t.integer "recipes_count"
  end

  add_index "recipe_categories", ["name"], :name => "index_recipe_categories_on_name"

  create_table "recipes", :force => true do |t|
    t.string   "user_name"
    t.string   "title"
    t.text     "body"
    t.boolean  "shown",              :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_category_id"
  end

  create_table "recipes_comments", :force => true do |t|
    t.integer  "recipe_id"
    t.string   "email"
    t.string   "user_name"
    t.text     "body"
    t.boolean  "shown",      :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes_comments", ["recipe_id"], :name => "index_recipes_comments_on_recipe_id"

  create_table "relative_articles", :force => true do |t|
    t.integer "article_id"
    t.integer "relative_id"
  end

  add_index "relative_articles", ["article_id"], :name => "index_relative_articles_on_article_id"
  add_index "relative_articles", ["relative_id"], :name => "index_relative_articles_on_relative_id"

  create_table "relative_questions", :force => true do |t|
    t.integer "question_id"
    t.integer "relative_id"
  end

  add_index "relative_questions", ["question_id"], :name => "index_relative_questions_on_question_id"
  add_index "relative_questions", ["relative_id"], :name => "index_relative_questions_on_relative_id"

  create_table "reviews", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.boolean  "shown",      :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "where_from"
    t.integer  "honey_sort"
    t.boolean  "on_index",          :default => false, :null => false
    t.boolean  "on_top",            :default => false, :null => false
    t.boolean  "shown",             :default => true,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "price"
    t.boolean  "prod",              :default => false, :null => false
    t.boolean  "fresh",             :default => false, :null => false
    t.integer  "position"
    t.string   "logo_name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_mask",                             :default => 0,  :null => false
    t.integer  "articles_count",                        :default => 0,  :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
