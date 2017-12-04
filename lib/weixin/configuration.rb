module Weixin
	def self.configuration(&block)
		yield @config ||= Weixin::Configuration.new
	end

	def self.config
		@config
	end

	class Configuration
		include ActiveSupport::Configurable
		# 每个企业都拥有唯一的corpid
		config_accessor :corpid
		# 微信回调域名
		config_accessor :callback_domain
		# 第一个微信应用对应的secret
		config_accessor :first_app_secret
		# 第一个微信应用对应的agentid
		config_accessor :first_app_agentid
		# access_token是企业后台去企业微信的后台获取信息时的重要票据
		config_accessor :access_token

	end
	# 参数初始化
	configuration do |config|
		config.corpid = ""
		config.first_app_secret = "xcRosuNsPy6xeskZwhCKH0PgZ_W-6iEIuv5c0JqMRfI"
		config.first_app_agentid = "1000002"
	end	
end
