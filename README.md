ruby-stingray
=============

Playing with the REST api in Riverbed Stingray Trafficmanager

A typical usage would be: 

`./start_stop_vs.rb virtual_server_name`

`./modify_pool.rb pool_name 10.100.9.201:8181,10.100.9.202:8181`

`./drain pool_name`

`./list_pool_nodes.rb pool_name`

`./delete_pool.rb pool_name`

`./start_stop_vs.rb virtual_server_name`


Nothing special, just tidier ruby compared with the example from [Riverbed](https://splash.riverbed.com/docs/DOC-1710) and hopefully more usable/readable/downloadable files.

`./list.rb` will list all the possible operation you can do within StingRay

'Tested' on Stingray 9.3 and ruby 2.0, you'll need rest-client and json gems present on your env.
