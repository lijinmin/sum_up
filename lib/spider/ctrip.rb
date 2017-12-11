module Spider
	class Ctrip
		include Spider
		def run(url="http://hotels.ctrip.com/hotel/375464.html?isFull=F#ctm_ref=hod_sr_lst_dl_n_1_1")
			str = body(url)
			doc = Hpricot(str)
			hotel_name = hotel_name(doc)
			adress = adress(doc)
			comment_score = comment_score(doc)
			introduction = introduction(doc)
			flags = flags(doc)
		end

		def hotel_name(doc)
			name = doc.search("div.name h2").inner_html
			return name
		end

		def adress(doc)
			adress = doc.search("div.adress").inner_html.gsub_html
			return adress
		end

		def comment_score(doc)
			comment_score= {}
			comment_score["score"] = doc.search("div.htl_com_box a.commnet_score").attr('title')
			comment_score["num"] = doc.search("div.htl_com_box span.commnet_num").inner_html.gsub_html
			return comment_score
		end

		def introduction(doc)
			content = doc.search("div.htl_room_txt .text_3l span")[1].inner_html.gsub_html
			return content
		end

		def flags(doc)
			flags = []
			doc.search("div.grade div.special_label i").each do |f|
				flags << f.inner_html.gsub_html
			end
			return flags
		end
	end
end