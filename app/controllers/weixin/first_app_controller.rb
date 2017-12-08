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
		# options = params['options']
		# options.store('touser','LiJinMin')
		# options.store('agentid',session[:agentid])
		# Weixin.send_text_message(options)

		options = {'content'=>'asdfsd','email'=>'lijinmin3903@126.com'}
		logger.info "--------#{options}---------------------"
		UserMailer.send_email(options).deliver_now
		redirect_to :action=>"index"
	end
	private

	# 该微信应用对应的agentid
	def app_agentid
		session[:agentid] = Weixin.config.first_app_agentid
	end
end