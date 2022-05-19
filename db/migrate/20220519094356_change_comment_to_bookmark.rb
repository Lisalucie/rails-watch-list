class ChangeCommentToBookmark < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookmarks, :commment, :comment
  end
end
