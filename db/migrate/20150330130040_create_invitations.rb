class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :senderName
      t.string :replyToEmail,         null: false
      t.belongs_to :email_template,   index: true
      t.belongs_to :user,             index: true

      t.timestamps
    end
  end
end
