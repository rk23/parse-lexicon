class AddYearToText < ActiveRecord::Migration
  def change
    add_column :texts, :year, :integer
  end
end
