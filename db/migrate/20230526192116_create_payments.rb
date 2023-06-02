class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :card_number
      t.text :expire_date
      t.integer :security_code
      t.text :card_holder

      t.timestamps
    end
  end
end
