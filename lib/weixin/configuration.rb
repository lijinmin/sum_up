class Weixin::Configuration
	include ActiveSupport::Configurable
	# 每个企业都拥有唯一的corpid
	config_accessor :corpid
	# 微信回调域名
	config_accessor :callback_domain
end