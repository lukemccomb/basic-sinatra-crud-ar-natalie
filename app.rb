require "sinatra"
require "rack-flash"
require "gschool_database_connection"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])

  end

  get "/" do
    erb :homepage, :locals => {:username => @username}
  end

  post "/registration/" do
    @database_connection.sql("INSERT INTO users (username) VALUES ('#{params[:username]}');")
  redirect "/"
  end

  get "/registration/" do
    erb :registration
  end

  post "/registration/" do
    flash[:notice] = "Thank you for registering"

    redirect "/"
  end
end
