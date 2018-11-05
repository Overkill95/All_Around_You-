class AddCompositePrimaryKeys < ActiveRecord::Migration[5.1]
  def change
    add_index :recensionis, ['user_id', 'servizi_id'], unique: true
  end
end
