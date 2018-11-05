class Addcolumnstorecensioni < ActiveRecord::Migration[5.1]
  def change
    add_column :servizis, :numvoti, :integer, :default => 0
    add_column :servizis, :mediavoti, :integer, :default => 0
  end
end
