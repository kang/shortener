require 'sinatra'
require 'active_record'
require 'pry'

###########################################################
# Configuration
###########################################################
# binding.pry

set :public_folder, File.dirname(__FILE__) + '/public'

configure :development, :production do
    ActiveRecord::Base.establish_connection(
       :adapter => 'sqlite3',
       :database =>  'db/dev.sqlite3.db'
     )
end
# Handle potential connection pool timeout issues
after do
    ActiveRecord::Base.connection.close
end

###########################################################
# Models
###########################################################
# Models to Access the database through ActiveRecord.
# Define associations here if need be
# http://guides.rubyonrails.org/association_basics.html

class Link < ActiveRecord::Base # this is an active record
  # def set(url)
  #   @url = url
  # end

  # def display

  # end
end

# link = Link.new()
# link.save()
# Link.find(id)
# Link.find_by_url()

###########################################################
# Routes
###########################################################

get '/' do

  # save all information into array
  # iterate through array
  # display information
  @links = [] # FIX ME
  erb :index
end

get '/new' do
  erb :form
end

# Link.create()

post '/new' do |url|
  l = Link.new
  #find_or_create_by_url 
  l.url = url
  # @createLinks = CreateLinks.new()

  # write into database
  # re-get
  # PUT CODE HERE TO CREATE NEW SHORTENED LINKS
  # @links << :url


  # yourlink = new Link(:url)
  # @links << yourlink.actualUrl
  # puts :url
end

# MORE ROUTES GO HERE