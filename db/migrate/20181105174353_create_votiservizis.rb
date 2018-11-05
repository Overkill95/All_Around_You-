class CreateVotiservizis < ActiveRecord::Migration[5.1]
  def change
    create_table :votiservizis do |t|
      t.boolean :voto
      t.references :user, foreign_key: true
      t.references :servizi, foreign_key: true

      t.timestamps
    end
  end
end
