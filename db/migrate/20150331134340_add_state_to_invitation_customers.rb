class AddStateToInvitationCustomers < ActiveRecord::Migration
  def change
    add_column :invitation_customers, :state, :int
  end
end
