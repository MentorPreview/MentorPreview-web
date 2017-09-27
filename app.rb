require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/' do
  @camps = Camp.all
  @courses = Course.all
  @mentors = Mentor.all
	erb :index
end

post '/camps/create' do
  Camp.create(
    name: params[:name]
    )
  redirect '/'
end

post '/mentors/create' do
  Mentor.create(
    name: params[:name]
    )
  redirect '/'
end