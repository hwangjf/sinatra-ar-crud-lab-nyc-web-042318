
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   erb :index
  # end
  get '/posts/new' do #this is the actual from
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    # erb :index
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :index
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    # Post.destroy_by_id(@post.id)
    erb :delete
  end
end
