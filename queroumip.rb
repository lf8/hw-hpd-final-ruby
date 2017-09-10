#
# CodeOps HPD - High Performance Devops
# Homework #01- Ruby
# ®2017 @LuisMarta - luistecnologia@hotmail.com
#
require './control_ip'
require 'thor'

class MyCLI < Thor
  desc "getip login@domanin", "10.1.10.3 para o usuário name@dominio.com"
  def getip(login)
    Tools.ipdisponivel(login)
  end
  desc "recarregar", "libera todos os IPs para uso"
  def recarregar()
    Tools.recarregarips()
  end
end

MyCLI.start(ARGV)
