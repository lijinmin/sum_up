# 第一个微信应用
class Weixin::FirstAppController < Weixin::BaseController
	before_filter :app_agentid
	before_filter :user_authorization
	def index
		
	end

	def show
		
	end

	def new
		
	end

	def send_message
		options = params['options']
		options.store('touser','LiJinMin')
		options.store('agentid',session[:agentid])
		Weixin.send_text_message(options)
		redirect_to :action=>"index"
	end
	private

	# 该微信应用对应的agentid
	def app_agentid
		session[:agentid] = Weixin.config.first_app_agentid
	end
end