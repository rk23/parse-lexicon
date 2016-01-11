class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :understood_word
      t.string :language

      t.timestamps null: false
    end
  end
end
