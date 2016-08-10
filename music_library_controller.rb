require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/album') 
require_relative('./models/artist') 

get '/artists' do
  @artists = Artist.all()
  erb ( :'artists/index' )
end

get '/artists/new' do 
  erb( :'artists/new' )
end

get '/artists/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end  

post '/artists/:id' do
  Artist.update( params )
  redirect (to( "/artists/#{params[:id]}" ))
end  

get '/artists/:id' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/show' )
end 

post '/artists' do 
  @artist = Artist.new( params )
  @artist.save() 
  erb( :'artists/create' )
end

post '/artists/:id/delete' do #use post instead of delete cos not all browsers support 'delete'
  Artist.destroy( params[:id] )
  redirect (to( '/artists' ))
end  

get '/albums' do
  @albums = Album.all()
  erb ( :'albums/index' )
end

get '/albums/new' do 
  @artists = Artist.all
  erb( :'albums/new' )
end

get '/albums/:id/edit' do
  @album = Album.find( params[:id] )
  erb( :'albums/edit' )
end  

post '/albums/:id' do
  Album.update( params )
  redirect (to( "/albums/#{params[:id]}" ))
end  

get '/albums/:id' do
  @album = Album.find( params[:id] )
  erb( :'albums/show' )
end  

post '/albums' do 
  puts params
  @album = Album.new( params )
  @album.save() 
  erb( :'albums/create' )
end

post '/albums/:id/delete' do 
  Album.destroy( params[:id] )
  redirect (to( '/albums' ))
end  
