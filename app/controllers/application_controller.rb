class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #create
  get ('/recipes/new') {
    erb :new
  }

   post('/recipes')  {
    @recipes = Recipe.create(params)
    redirect ("/recipes/#{@recipes.id}")
  }

  get('/recipes') {
    @recipes = Recipe.all
    erb :index
  }
  
  get ('/recipes/:id') {
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  }

  get ('/recipes/:id/edit') {
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  }

  patch ('/recipes/:id') {
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(params[:recipe])
    redirect ("/recipes/#{@recipe.id}")
  }

  delete ('/recipes/:id') {
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect ('/recipes')
  }
end
