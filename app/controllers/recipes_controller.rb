class RecipesController < ApplicationController

get '/recipes' do
    @recipes = Recipe.all
    erb :"recipes/index"
  end

  get '/recipes/new' do

    erb :"recipes/new"
  end

  post '/recipes' do  
    @recipe = Recipe.create(params)

    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id].to_i)

    erb :"recipes/show"
  end

  get '/recipes/:id/edit' do

    @recipe = Recipe.find(params[:id].to_i)

    erb :"recipes/edit"
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id].to_i)
    @recipe.name = params["name"]
    @recipe.ingredients = params["ingredients"]
    @recipe.cook_time = params["cook_time"]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id].to_i)
    redirect "/recipes"

  end
end