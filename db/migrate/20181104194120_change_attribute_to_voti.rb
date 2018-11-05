class ChangeAttributeToVoti < ActiveRecord::Migration[5.1]
  def change
    change_column :voti_ds, :voto, :boolean
  end
end
