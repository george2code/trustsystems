class CreateAfs < ActiveRecord::Migration
  def change
    create_table :afs do |t|
      t.belongs_to :user
      t.integer :email_delay
      t.string :email_subject
      t.belongs_to :email_template
      t.text :email_template_text

      t.timestamps
    end
  end
end
