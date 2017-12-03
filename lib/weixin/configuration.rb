class Weixin::Configuration
	include ActiveSupport::Configurable
	# 每个企业都拥有唯一的corpid
	config_accessor :corpid
	# 微信回调域名
	config_accessor :callback_domain
	# 第一个微信应用对应的secret
	config_accessor :first_app_secret
	# access_token是企业后台去企业微信的后台获取信息时的重要票据
	config_accessor :access_token
end