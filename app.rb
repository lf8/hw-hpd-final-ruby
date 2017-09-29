#
# CodeOps HPD - High Performance Devops
# Homework - Final - Ruby
# ®2017 @LuisMarta - luistecnologia@hotmail.com
#

require 'sinatra'
require '/var/opt/sinatra/src/control_ip'
require 'json'
require 'logger'

get '/' do
  erb :help
end

####### Mapeamento Virtual Machines
#Criar
get '/cadastrarvm' do
  erb :cadastrarvm
end

post '/vms' do
  vm = []
  vm.push(params)
  vm = vm.to_json
  id = ""
  json = disk
  acao = "cadastrando disco"
  Tools.logarfrontend(id, json, acao)
  erb :cadastrarvm
end

#Listar
get '/vms' do
  @virtualmachinesRest = Tools.listavmnofrontend()
  erb :vmachine 
end
#Atualizar
put '/vms' do
  @data = request_json
  id = params[:id]
  json = @data
  acao = "atualizando vm"
  Tools.logarfrontend(id, json, acao)  
end
#Remover
delete '/vms' do
  @data = request_json
  id = params[:id]
  json = @data
  acao = "removendo vm"
  Tools.logarfrontend(id, json, acao)  
end

####### Mapeamento Disk
#Criar
get '/cadastrardiscos' do
  erb :cadastraDiscos
end

post '/disks' do
  disk = []
  disk.push(params)
  disk = disk.to_json
  id = ""
  json = disk
  acao = "cadastrando disco"
  Tools.logarfrontend(id, json, acao)
  erb :cadastraDiscos
end
#Listar
get '/disks' do
  @diskmachinesRest = Tools.listadisconofrontend()
  erb :disks  
end

#Atualizar
put '/disks/:id' do
  @data = request_json
  id = params[:id]
  json = @data
  acao = "atualizando disco"
  Tools.logarfrontend(id, json, acao)
end

#Remover
delete '/disks/:id' do
  @data = request_json
  id = params[:id]
  json = @data
  acao = "removendo disco"
  Tools.logarfrontend(id, json, acao)
end

####### Mapeamento Network
#Criar
get '/cadastrarIP' do
  erb :cadastraIPs
end

post '/netw' do
  ip = []
  ip.push(params)
  ip = ip.to_json
  puts "o ip json #{ip}"
  id = ""
  json = ip
  acao = "cadastrando ip"
  Tools.logarfrontend(id, json, acao)
  erb :cadastraIPs
end

#Listar
get '/netw' do
  @listaipsfrontend = Tools.listaips()
  erb :netw
end

#Atualizar
put '/netw' do
  @data = request_json
  id = params[:id]
  json = @data
  acao = "atualizando ip"
  Tools.logarfrontend(id, json, acao)
end
#Remover
delete '/netw' do
  @data = request_json
  id = params[:id]
  json = @data
  acao = "removendo ip"
  Tools.logarfrontend(id, json, acao)  
end

def request_json
  request.body.rewind
  ::JSON.parse(request.body.read)
end

