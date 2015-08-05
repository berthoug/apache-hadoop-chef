require 'spec_helper'

describe service('namenode') do  
  it { should be_enabled   }
  it { should be_running   }
end 

describe service('datanode') do  
  it { should be_enabled   }
  it { should be_running   }
end 

describe service('resourcemanager') do  
  it { should be_enabled   }
  it { should be_running   }
end 

describe service('nodemanager') do  
  it { should be_enabled   }
  it { should be_running   }
end 

describe service('JobHistoryServer') do  
  it { should be_running   }
end 

describe command("su hdfs -l -c \"/srv/hadoop/bin/hdfs dfs -ls /\"") do
  its (:stdout) { should match /mr-history/ }
end

describe command("su yarn -l -c \"/srv/hadoop/bin/yarn jar /srv/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar pi 1 1000 \"") do
#  its(:exit_status) { should eq 0 }
  its (:stdout) { should match /Estimated value of Pi is/ }
end

