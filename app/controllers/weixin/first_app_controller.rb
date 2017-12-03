# 第一个微信应用
class Weixin::FirstAppController < Weixin::BaseController
	before_filter :user_authorization
	def index
		
	end

	def show
		
	end
	private

	# 该微信应用对应的secret
	def app_secret
		session[:secret] = Weixin::Configuration.first_app_secret
	end
end