require 'sinatra'
require './control_ip'
require 'json'

set :port, 8081
get '/' do
  erb :form
end

post '/api/' do
  request.body.rewind
  request_payload = JSON.parse request.body.read
 
  puts request_payload
end

post '/' do
  puts params
end

post '/login' do
  usuarios = []
  usuarios.push(params)
  puts usuarios.inspect
  redirect '/'
end

get '/usuarios' do
  @usuarios = ['aa','bb']
  erb :usuarios
end

get '/file_read/:name' do
  puts params["name"]
  File.read("/tmp/ruby.txt")
end

# Mapeamento Virtual Machines
#Criar
post '/vms' do
  
end
#Listar
get '/vms' do
  
end
#Atualizar
put '/vms' do
  
end
#Remover
delete '/vms' do
  
end

# Mapeamento Disk
#Criar
post '/disks' do

end
#Listar
get '/disks' do
  diskMachines = File.read("diskMachines.jason")
  @diskmachinesRest = JSON.parse diskMachines
  puts @diskmachinesRest.class
  puts @diskmachinesRest.size
  puts @diskmachinesRest
  @diskmachinesRest
  erb :disks  
end
#Atualizar
put '/disks' do
  
end
#Remover
delete '/disks' do
  
end

# Mapeamento Network
#Criar
post '/netw' do
  
end

#Listar
get '/netw' do
  #File.read("ipdisponivel.list")
  @listaipsfrontend = Tools.listaips()
  erb :netw
end

#Atualizar
put '/netw' do
  
end
#Remover
delete '/netw' do
  
end


