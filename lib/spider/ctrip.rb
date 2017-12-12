module Spider
	class Ctrip
		include Spider
		attr_accessor :hotel_name
		attr_accessor :adress
		attr_accessor :comment_score
		attr_accessor :introduction
		attr_accessor :flags
		attr_accessor :client_comment
		def initialize
			
		end
		def run(url="http://hotels.ctrip.com/hotel/375464.html?isFull=F#ctm_ref=hod_sr_lst_dl_n_1_1")
			str = body(url)
			doc = Hpricot(str)
			@hotel_name = get_hotel_name(doc)
			@adress = get_adress(doc)
			@comment_score = get_comment_score(doc)
			@introduction = get_introduction(doc)
			@flags = get_flags(doc)
			@client_comment = get_client_comment(doc)
		end

		def get_hotel_name(doc)
			name = doc.search("div.name h2").inner_html
			return name
		end

		def get_adress(doc)
			adress = doc.search("div.adress").inner_html.gsub_html
			return adress
		end

		def get_comment_score(doc)
			comment_score= {}
			comment_score["score"] = doc.search("div.htl_com_box a.commnet_score").attr('title')
			comment_score["num"] = doc.search("div.htl_com_box span.commnet_num").inner_html.gsub_html
			return comment_score
		end

		def get_introduction(doc)
			content = doc.search("div.htl_room_txt .text_3l span")[1].inner_html.gsub_html
			return content
		end

		def get_flags(doc)
			flags = []
			doc.search("div.grade div.special_label i").each do |f|
				flags << f.inner_html.gsub_html
			end
			return flags
		end

		def get_client_comment(doc)
			client_comment = []
			doc.search("div.bar_score p").each do |p|
				name = p.inner_html.split('<')[0]
				value = p.search("span").inner_html.to_f
				client_comment << {"name"=>name,"value"=>value}
			end
			return client_comment
		end
	end
end