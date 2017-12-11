# http://wutaoo.iteye.com/blog/224885
module Spider
	def body(url="http://hotels.ctrip.com/hotel/375464.html?isFull=F#ctm_ref=hod_sr_lst_dl_n_1_1")
		client = HTTPClient.new
		res = client.get(url).body
		return res
	end

end
class String
	def gsub_html
		self.gsub(/\r|\t|\n/,"").gsub(/<(\S*?)[^>]*>.*?|<.*? \/>/,"").gsub("&nbsp;","").gsub(" ","")
	end
	def to_gb
		Iconv.conv("gb2312//IGNORE","UTF-8//IGNORE",self)
	end
	def utf8_to_gb
		Iconv.conv("gb2312//IGNORE","UTF-8//IGNORE",self)
	end
	def gb_to_utf8
		Iconv.conv("UTF-8//IGNORE","GB18030//IGNORE",self)
	end
	def to_utf8
		Iconv.conv("UTF-8//IGNORE","GBK//IGNORE",self)
	end
end
