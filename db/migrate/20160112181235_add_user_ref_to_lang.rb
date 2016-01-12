class AddUserRefToLang < ActiveRecord::Migration
  def change
    add_reference :user_languages, :user, index: true, foreign_key: true
  end
end
