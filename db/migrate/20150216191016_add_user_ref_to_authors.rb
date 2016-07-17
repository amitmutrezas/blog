class AddUserRefToAuthors < ActiveRecord::Migration
  def change
    add_reference :authors, :user, index: true
    add_foreign_key :authors, :users
  end
end
