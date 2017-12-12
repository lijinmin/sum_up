#coding:utf-8
# 第一个爬虫应用
class Spider::FirstAppController < Spider::BaseController

	def spider

		
	end

	def search
		url = params[:url]
		# url = 'http://hotels.ctrip.com/hotel/375464.html?isFull=F#ctm_ref=hod_sr_lst_dl_n_1_1'
		if url.present?
			@res = Spider::Ctrip.new
			@res.run(url)
		end		
		logger.info "#{@res.client_comment.to_json}"
	end
end