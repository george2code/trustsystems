class CreateUserCompanies < ActiveRecord::Migration
  def change
    create_table :user_companies do |t|
      t.belongs_to  :user,    index: true
      t.belongs_to  :company, index: true
      t.timestamps
    end
  end
end