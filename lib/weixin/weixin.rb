module Weixin
	def self.configuration(&block)
		yield @config ||= Weixin::Configuration.new
	end

	def self.config
		@config
	end
	# 参数初始化
	configuration do |config|
		config.callback_domain = ""
		config.corpid = "wwbdeb63c9d189b528"
		config.first_app_secret = "xcRosuNsPy6xeskZwhCKH0PgZ_W-6iEIuv5c0JqMRfI"
		config.first_app_agentid = "1000002"
	end		

	# 获取access_token
	def self.access_token(agentid)
		str = $redis.get("wx_token#{agentid}")
		time = str.split(",")[1] rescue 0
		 if Time.now.to_i - time.to_i > 6500
		 	access_token = save_access_token(agentid)
		 	return access_token
		 else
		 	return str.split(',')[0]
		 end
	end

	# 通过code获取user
	def self.get_userid(code,agentid)
		access_token = access_token(agentid)
		user_info =get("https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=#{access_token}&code=#{code}")
		return user_info['UserId']
	end

	# 发送文本消息
	def self.send_text_message(options={'touser'=>'LiJinMin','agentid'=>'1000002','content'=>'hahahaha'})
		access_token = access_token(options['agentid'])
		url = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=#{access_token}"
		data = data = '{"touser":"' + options['touser'] + '", "msgtype":"text", "agentid":"'+options['agentid']+'", "text": { "content":"' + options['content'] + '"}}'
		post(url,data)
	end


	private
	def self.save_access_token(agentid)
		secret = get_secret(agentid)
		corpid = Weixin.config.corpid
		doc = get("https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=#{corpid}&corpsecret=#{secret}")
		access_token = doc['access_token']
		$redis.set("wx_token#{agentid}","#{access_token},#{Time.now.to_i}")
		return access_token
	end

	def self.get_secret(agentid)
		return agentid_secrets[agentid]
	end

	def self.agentid_secrets
		return {"1000002"=>"xcRosuNsPy6xeskZwhCKH0PgZ_W-6iEIuv5c0JqMRfI"}
	end

	def self.get(url)
		client = RestClient::Request.execute :method => :get, :url => url, :ssl_version => 'TLSv1'
		return JSON.parse(client.body)
	end

	def self.post(url,json_data)
		response = RestClient.post(url, json_data, :content_type => :json)
		return JSON.parse(response.body)
	end

end