class AddFieldsToInvites < ActiveRecord::Migration
  def change
    add_column :invitations, :email, :string
    add_column :invitations, :name, :string
    add_column :invitations, :orderId, :string
    add_column :invitations, :state, :integer
  end
end
