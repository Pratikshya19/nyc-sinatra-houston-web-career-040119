class LandmarksController < ApplicationController
  # add controller methods



  get '/landmarks' do
    @landmarks = Landmark.all
  erb :'landmarks/index'
  end
  
  get '/landmarks/new' do
    erb :'landmarks/new'
  
  end
  
  get '/landmarks/:id' do
    @landmark = current_landmark
  
    erb :'landmarks/show'
  end
  
  post 'landmarks' do
    # Landmark.create(params)
    redirect '/landmarks'
  end
  
  
  get '/landmarks/:id/edit' do
    @landmark = current_landmark
    erb :'landmarks/edit
  end
  
  
  
  patch '/landmarks/:id' do
    
    landmark = current_landmark
    landmark.update(name: params[:name])
    redirect "/landmarks/#{params[:id]}"
  end
  
  
 
  
  delete '/landmarks/:id' do
  landmark = current_landmark
    landmark.destroy
    redirect "/landmarks"
  end
  
  
  
  
  
  def current_landmark
    Landmark.find(params[:id]) 
  end
  
end
