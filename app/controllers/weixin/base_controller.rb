class Weixin::BaseController  < ActionController::Base
	layout "weixin_layout"
	before_filter :current_user
	# 当前用户
	def current_user
	      if session[:user_id]
	        	@current_user = Weixin::User.find_by_id(session[:user_id])
	      end		
	      @current_user = Weixin::User.first # 测试用
	end

	def user_authorization
		session[:path] = request.path
		if @current_user.blank?
			redirect_to auth
		end	
	end	
	# https://work.weixin.qq.com/api/doc#10028/根据code获取成员信息
	# 通过网页授权接口可以获取到当前用户的UserId信息
	# 获取code
	def auth
		    corpid = Weixin.config.corpid
		    agentid = session[:agentid]
		    url = "#{Weixin.config.callback_domain}/mobile_login/call_back"
		    url = url.gsub(/[^a-zA-Z0-9_\-.]/n){ sprintf("%%%02X", $&.unpack("C")[0]) }
		    wx_reurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=#{corpid}&redirect_uri=#{url}&response_type=code&scope=snsapi_userinfo&agentid=agentid&state=#wechat_redirect"

		    redirect_to wx_reurl
	end

	# 根据code获取成员信息
	def call_back
		code = params[:code]
		agentid = session[:agentid]
		session[:user_id] = Weixin.get_userid(code,agentid)
		redirect_to session[:path]
	end
end