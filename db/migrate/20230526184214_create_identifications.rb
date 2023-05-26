class CreateIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :identifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :first_name
      t.text :last_name

      t.timestamps
    end
  end
end
