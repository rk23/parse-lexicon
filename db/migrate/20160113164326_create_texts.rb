class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :link
      t.string :language
      t.string :author
      t.string :img_link

      t.timestamps null: false
    end
  end
end
