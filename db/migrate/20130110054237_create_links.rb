# Put your database migration here!
#
# Each one needs to be named correctly:
# timestamp_[action]_[class]
#
# and once a migration is run, a new one must
# be created with a later timestamp.

class CreateLinks < ActiveRecord::Migration
    # PUT MIGRATION CODE HERE TO SETUP DATABASE
    def self.up
      create_table :links do |t|
        t.string :url, :null => false
        t.timestamp
      end
    end

    # def self.up
    #   add_column :links, :shortened, :timestamp
    # end

    def self.down
      drop_table :links
    #   remove_column :links, :shortened, :timestamp
    end

end
