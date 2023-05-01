require 'gossip'

class ApplicationController < Sinatra::Base #(hérite de toutes les fonctionnalités de Sinatra)
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  # get '/gossips/:id' do
  #   case params[:id] #case est utilisé pour tester la valeur de id
  #   when '2', '3'
  #   "voici le numéro du potin que tu veux : #{params[:id]}!"
  #   else
  #     "Ce potin n'existe pas"
  # end
#end
end


  #run! if app_file == $0 #permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier
