class CreateVotiRs < ActiveRecord::Migration[5.1]
  def change
    create_table :voti_rs do |t|
      t.boolean :voto
      t.references :user, foreign_key: true
      t.references :risposte, foreign_key: true

      t.timestamps
    end
  end
end
