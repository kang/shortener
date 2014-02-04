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
  # attr_accessor :code
  # def code
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
  c = Link.find(:all)
  c.each do |link|
    @links.push(link)
  end

  erb :index
end

get '/new' do
  erb :form
end


# Link.create()

post '/new' do
  tmpURL = params[:url]
  tmpCode = params[:url].hash
  if (params[:url])[0..2] == 'www' || (params[:url])[0..3] == 'http'
    if (Link.exists?(:url => tmpURL))
      lnk = Link.where(:url => tmpURL)[0]
      puts "#{lnk} found old url"
    else
      puts "created new url"
      lnk = Link.create({:url => tmpURL, :code => tmpCode})
    end
  else
    puts "error"
  end
  puts  "returns last #{lnk}"
  lnk.to_json
end

# MORE ROUTES GO HERE


  # l = Link.find_or_create_by_url
  # @createLinks = CreateLinks.new()

  # write into database
  # re-get
  # PUT CODE HERE TO CREATE NEW SHORTENED LINKS
  # @links << :url


  # yourlink = new Link(:url)
  # @links << yourlink.actualUrl
  # puts :url