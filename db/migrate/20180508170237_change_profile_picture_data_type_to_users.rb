class ChangeProfilePictureDataTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :date_of_birth, :date
    change_column :users, :profile_picture, :attachment
  end
end
