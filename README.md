hw-hpd-final-ruby
====

Download and run hw-hpd-final-ruby:

git clone https://github.com/lf8/hw-hpd-final-ruby.git

cd hw-hpd-final-ruby

bundle install                  # To install sinatra

bundle exec ruby application    # To run the sample

[http://localhost:8081/](http://localhost:8081/)

Vai!!!!
===

Abrir  [http://localhost:8081/](http://localhost:8081/)


Methods API's
=============

Networkin  	-  	[http://localhost:8081/netw/](http://localhost:8081/netw)

Disks  		-  	[http://localhost:8081/disks](http://localhost:8081/disks)

Vms  		-  	[http://localhost:8081/vms](http://localhost:8081/vms)

::POST
=============

Networkin  	-  	[http://localhost:8081/cadastrarIP](http://localhost:8081/cadastrarIP)

Disks  		-  	[http://localhost:8081/cadastrardiscos](http://localhost:8081/cadastrardiscos)

Vms  		-  	[http://localhost:8081/cadastrarvm](http://localhost:8081/cadastrarvm)

::DELETE
=============

Networkin  	-  	http://localhost:8081/netw/ID

Disks  		-  	http://localhost:8081/disks/ID

Vms  		-  	http://localhost:8081/vms/ID


Example 	- 	curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X DELETE -d '{"disks1": [{"id":"01", "name":"disc_hpd01", "type":"SATA", "size":"20TB"}]}' http://localhost:8081/disks/01

::PUT
============

Networkin  	-  	http://localhost:8081/netw/ID

Disks  		-  	http://localhost:8081/disks/ID

Vms  		-  	http://localhost:8081/vms/ID


Example		- 	curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT -d '{"disks1": [{"id":"01", "name":"disc_hpd01", "type":"SATA", "size":"20TB"}]}' http://localhost:8081/disks/01

::JSON DATA EXAMPLE
===================

Networkin	- [{"ip":"10.1.10.56"}]

Disks		- [{"disks1"=>[{"id"=>"01", "name"=>"disc_hpd01", "type"=>"SATA", "size"=>"20TB"}]}]

Vms			- [{"VirtualMachines01"=>[{"id":"01","name":"hpd01","cpu":"Quad-Core","ram":"96","disk":"20TB"}]}]

