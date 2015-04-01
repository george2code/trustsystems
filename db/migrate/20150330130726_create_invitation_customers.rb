class CreateInvitationCustomers < ActiveRecord::Migration
  def change
    create_table :invitation_customers do |t|
      t.string :email,            null: false
      t.string :name,             null: false
      t.string :orderId
      t.belongs_to :invitation,   index: true

      t.timestamps
    end
  end
end
