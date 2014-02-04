class UpdateLinks < ActiveRecord::Migration

def up
      create_table :links, :force => true  do |t|
        t.string :url, :null => false
        t.timestamp
      end
 end

  def down
  end
end
