class CreateContactAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.text :mobile_number
      t.text :address_line1
      t.text :address_line2
      t.text :postcode
      t.text :country
      t.text :state_region

      t.timestamps
    end
  end
end
