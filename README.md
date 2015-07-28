# Apache Hadoop cookbook

[![Apache License 2.0](http://img.shields.io/badge/license-apache%202.0-green.svg)](http://opensource.org/licenses/Apache-2.0)
        - nde::memcached

# Requirements

This cookbook has been tested on the following versions (but may work on earlier ones):

* Chef 11.4.0+
* CentOS 6.5+
* Ubuntu 12.04+


####Recipes

* `install.rb` - Installs the Apache Hadoop Binaries
* `nn.rb` - Configures and starts the NameNode
* `dn.rb` - Configures and starts the DataNode
* `rm.rb` - Configures and starts the ResourceManager
* `nm.rb` - Configures and starts the NodeManager
* `jhs.rb`- Configures and starts the JobHistoryServer
* `ps.rb` - Configures and starts the ProxyServer


###Karamel usage

This cookbook is karamelized (www.karamel.io).  You can launch a Hadoop Cluster using the following yml file. It will create 3 VMs, where one is the master running NameNode, ResourceManager, and Job history server. The two other VMs are workers and will run the DataNode and NodeManager.

```
name: eu-west-1

cookbooks:                                                                      
  hadoop: 
    github: "hopshadoop/apache-hadoop-chef"
    branch: "master"
    
groups: 
  namenodes:
    size: 1
    recipes: 
        - hadoop::nn
        - hadoop::rm
        - hadoop::jhs                                                            
  datanodes:
    size: 2
    recipes: 
        - hadoop::dn
        - hadoop::nm
```


# Authors

Authors:: Jim Dowling. (<jdowling@kth.se>), Marc Bux 

# License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this software except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
