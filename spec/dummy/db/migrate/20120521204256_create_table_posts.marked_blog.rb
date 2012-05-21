# This migration comes from marked_blog (originally 20120426172253)
class CreateTablePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.timestamps
    end
  end
end
