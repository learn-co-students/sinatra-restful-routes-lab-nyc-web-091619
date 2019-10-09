class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do 
    redirect to "/recipes"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :"recipes/index"
  end

  get '/recipes/new' do
    erb :"recipes/new"
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params) #create new recipe
    redirect "/recipes/#{@recipe.id}" #redirect back to recipe show page
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :"recipes/show"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id]) #define variable to edit
    @recipe.update(params[:recipe]) #assign new attributes
    redirect "/recipes/#{@recipe.id}" #redirect back to recipe show page
  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end

end
