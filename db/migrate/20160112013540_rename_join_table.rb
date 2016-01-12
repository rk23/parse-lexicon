class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :user_words, :users_words
  end
end
