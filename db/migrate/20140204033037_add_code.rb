class AddCode < ActiveRecord::Migration
  def up
  end

  def change
    add_column :links, :code, :string
  end

  def down
  end
end
