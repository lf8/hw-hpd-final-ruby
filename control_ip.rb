#
# CodeOps HPD - High Performance Devops
# Homework #01- Ruby
# ®2017 @LuisMarta - luistecnologia@hotmail.com
#
require 'logger'
module Tools
    module_function

    @logger = Logger.new(STDOUT)
    @logger = Logger.new('requestsip.log')
    file = File.open('requestsip.log',File::WRONLY | File::APPEND)
    @logger.datetime_format = '%d-%m-%Y %H:%M:%S'
    @logger = Logger.new(file)

    @ipsvalidos = File.open("ipdisponivel.list")
    @ipsinvalidos = File.open("ipindisponivel.list")
    @arraydisponivel = []
    @arrayindisponivel = []

    def ipdisponivel(login)
        loadipvalidos()
        loadipinvalidos()
            if @arraydisponivel.size >= 1
                ipescolhido = @arraydisponivel.pop
                @arrayindisponivel.push(ipescolhido+"\n")
                puts "#{ipescolhido} para o usuário #{login}"
                #mensagemlog(ipescolhido,login)
                @logger.info('Mensagem') { "Solicitação de ip #{ipescolhido} do usuário #{login}"}
                File.write('ipdisponivel.list',@arraydisponivel.join("\n"))
                File.write('ipindisponivel.list',@arrayindisponivel.join("\n"))
            else
                puts "Não há ip disponivel"
                @logger.info('Critico') { "Falhou não há mais ips disponiveis para usuário #{login}"}
        end
    end

    def loadipvalidos()
        @ipsvalidos = File.open("ipdisponivel.list")
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
end
