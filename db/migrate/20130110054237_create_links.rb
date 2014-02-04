# Put your database migration here!
#
# Each one needs to be named correctly:
# timestamp_[action]_[class]
#
# and once a migration is run, a new one must
# be created with a later timestamp.

class CreateLinks < ActiveRecord::Migration
    # PUT MIGRATION CODE HERE TO SETUP DATABASE
    def change
      create_table :links do |t|
        t.string :url, :null => false
        t.timestamp
      end
    end

    # def self.up
    #   add_column :links, :shortened, :timestamp
    # end

    # def self.down
    #   remove_column :links, :shortened, :timestamp
    # end

end
# def change
  # create_table :links do |link|
  #   link.timestamp
  #   # t.timestamps
  # end

  #   say "Created a table"
  #   suppress_messages {add_index :links, }
  #   say "and an index!", true
  #   say_with_time 'Waiting for a while' do
  #     sleep 10
  #     250
  #   end
  # end

