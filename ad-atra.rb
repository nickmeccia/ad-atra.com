require 'sinatra'
require 'sinatra/reloader'
require 'sass/plugin/rack'
# require_relative './blah'

class App < Sinatra::Base
  get '/styles/*.scss' do
    filename = params[:splat].first
    scss "../styles/#{filename}".to_sym
  end

  get '/' do
    erb :index
  end

  get '/clean-coders' do
    erb :clean_coders, :layout => :layout
  end

  get '/cthulhu-wars' do
    erb :cthulhu_wars, :layout => :none
  end

  post '/thanks' do
    status = params[:status]
    names = params[:names]
    email = params[:email]
    song = params[:song]
    msg = <<-MSG
      status: #{status}
      names: #{names}
      email: #{email}
      song: #{song}
    MSG
    Send_msg(msg)
    erb :thanks, :layout => :none
  end

end
