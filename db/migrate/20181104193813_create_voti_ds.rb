class CreateVotiDs < ActiveRecord::Migration[5.1]
  def change
    create_table :voti_ds do |t|
      t.integer :voto
      t.references :user, foreign_key: true
      t.references :domande, foreign_key: true
      t.timestamps
    end
  end
end
