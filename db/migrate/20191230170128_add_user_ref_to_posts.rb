class AddUserRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, null: false
  end
end
