require 'sinatra'
require 'active_record'
require 'pry'

###########################################################
# Configuration
###########################################################

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

  def increment_count
    update_attribute :clicks, clicks+1
  end

end


###########################################################
# Routes
###########################################################

get '/' do

  # save all information into array
  # iterate through array
  # display information

  @links = []
  c = Link.find(:all)
  c.each do |link|
    @links.push(link)
  end
  erb :index
end

get '/new' do
  erb :form
end

post '/' do

end

post '/new' do
  tmpURL = params[:url]
  tmpCode = params[:url].hash
  if (params[:url])[0..2] == 'www' || (params[:url])[0..3] == 'http'
    if (Link.exists?(:url => tmpURL))
      lnk = Link.where(:url => tmpURL)[0]

      lnk.increment_count
    else
      clicks = 0
      lnk = Link.create({:url => tmpURL, :code => tmpCode, :clicks => clicks})
    end
  else
    puts "error"
  end
  lnk.to_json
end


