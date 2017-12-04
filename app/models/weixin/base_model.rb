class Weixin::BaseModel < ActiveRecord::Base
	self.abstract_class = true
	establish_connection :weixin
end