#redis 配置
$redis = Redis.new(:host => '127.0.0.1', :port => '6379', :db => 2)
#es 配置
$elastic = Elasticsearch::Client.new hosts: [{ host: '127.0.0.1',port: '9200',user: 'elastic',password: 'changeme'}], randomize_hosts: true, log: false
Elasticsearch::Model.client = $elastic
