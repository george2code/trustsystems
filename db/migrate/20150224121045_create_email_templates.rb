class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.string :language
      t.text :template

      t.timestamps
    end
  end
end
