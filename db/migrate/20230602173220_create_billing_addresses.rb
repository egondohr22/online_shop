class CreateBillingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_addresses do |t|
      t.text :card_number
      t.text :expire_date
      t.integer :security_code
      t.text :card_holder
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
