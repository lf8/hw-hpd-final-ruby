#
# CodeOps HPD - High Performance Devops
# Homework #01- Ruby
# ®2017 @LuisMarta - luistecnologia@hotmail.com
#
require 'logger'
module Tools
    module_function

    def logar()
      @logger = Logger.new(STDOUT)
      @logger = Logger.new('requestsip.log')
      file = File.open('requestsip.log',File::WRONLY | File::APPEND)
      @logger.datetime_format = '%d-%m-%T %H:%M:%S'
      @logger = Logger.new(file)
    end
    
    begin
      @ipsvalidos = File.open("ipdisponivel.list")
      @ipsinvalidos = File.open("ipindisponivel.list")
      @arraydisponivel = []
      @arrayindisponivel = []
    rescue Errno::ENOENT => e
      puts e.message
      puts "O arquivou não existe"
    rescue Exception => e
      puts e.message
      puts "ocorreu um erro"
    end

    def ipdisponivel(login)
        logar()
        loadipvalidos()
        loadipinvalidos()
            if @arraydisponivel.size >= 1
                ipescolhido = @arraydisponivel.pop
                @arrayindisponivel.push(ipescolhido+"\n")
                puts "#{ipescolhido} para o usuário #{login}"
                #mensagemlog(ipescolhido,login)
                @logger.info('Mensagem') { "Solicitação de ip #{ipescolhido} do usuário #{login}"}
                begin 
                  File.write('ipdisponivel.list',@arraydisponivel.join("\n"))
                  File.write('ipindisponivel.list',@arrayindisponivel.join("\n"))
                rescue Errno::ENOENT => e
                  puts e.message
                  puts "O arquivou não existe"
                rescue Exception => e
                  puts e.message
                  puts "ocorreu um erro"
                end
            else
                puts "Não há ip disponivel"
                @logger.info('Critico') { "Falhou não há mais ips disponiveis para usuário #{login}"}
            end
    end

    def loadipvalidos()
      begin
        @ipsvalidos = File.open("ipdisponivel.list")
      rescue Errno::ENOENT => e
        puts e.message
        puts "O arquivou não existe"
      rescue Exception => e
        puts e.message
        puts "ocorreu um erro"
      end
        @ipsvalidos.each do |linha|
        @arraydisponivel.push(linha.strip)
        end
        @arraydisponivel
    end

    def loadipinvalidos()
        @ipsinvalidos.each do |linha|
        @arrayindisponivel.push(linha.strip)
        end
        @arrayindisponivel
    end

    def recarregarips()
        @ipsinvalidos.each do |linha|
          @arrayindisponivel.delete(linha.strip)
		      recarregaip = linha.strip
          @arraydisponivel.push(recarregaip)
          File.write('ipdisponivel.list',@arraydisponivel.join("\n"))
          File.write('ipindisponivel.list',@arrayindisponivel.join("\n"))
        end
    end
    
    def listaips()
      loadipvalidos()
      #@arraydisponivel
    end
    
    def listadisconofrontend()
      diskMachines = File.read("diskMachines.jason")
      @diskmachinesRest = JSON.parse diskMachines
      @diskmachinesRest
    end
    
    def listavmnofrontend()
      diskMachines = File.read("virtualMachines.jason")
      @virtualmachinesRest = JSON.parse diskMachines
      @virtualmachinesRest
    end
    
    def cadastraipnetw()
      
    end
    
    def logarfrontend(id, json, acao)
      puts "logarfrontend"
      logar()
      @logger.info('Mensagem') { "#{acao} o id #{id}, json informando #{json}"}
    end
end
