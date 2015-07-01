class RemoveCommentableFk < ActiveRecord::Migration
  def change
    remove_foreign_key :comments, column: "commentable_id"
  end
end
