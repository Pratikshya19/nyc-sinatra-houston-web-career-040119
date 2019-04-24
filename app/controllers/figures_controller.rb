class FiguresController < ApplicationController
  # add controller methods

get '/figures' do
  @figures = Figure.all
erb :'figures/index'
end

get '/figures/new' do
  @titles = Title.all
  erb :'figures/new'


end

get '/figures/:id' do
  @figure = current_figure

  erb :'figures/show'
end


#
post '/figures' do
  # @figure = Figure.create([params['figure'])

  redirect '/figures'
end


get '/figures/:id/edit' do
  @figure = current_figure
  erb :'figures/edit'
end

#edit an existing figure

patch '/figures/:id' do
  figure = current_figure
  figure.update(name: params[:name])
  redirect "/figures/#{params[:id]}"
end


#delete an existing figure

delete '/figures/:id' do
figure = current_figure
  figure.destroy
  redirect "/figures"
end





def current_figure
  Figure.find(params[:id]) 
end

end

