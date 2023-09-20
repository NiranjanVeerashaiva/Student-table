class AddPublishedAtToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :publieshed_at, :datetime
  end
end
