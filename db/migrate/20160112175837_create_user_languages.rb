class CreateUserLanguages < ActiveRecord::Migration
  def change
    create_table :user_languages do |t|
      t.text :session_language
      t.boolean :current_language

      t.timestamps null: false
    end
  end
end
