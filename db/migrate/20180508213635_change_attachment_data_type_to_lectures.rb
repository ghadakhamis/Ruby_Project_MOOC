class ChangeAttachmentDataTypeToLectures < ActiveRecord::Migration[5.1]
  def change
    change_column :lectures, :attachment, :attachment
  end
end
