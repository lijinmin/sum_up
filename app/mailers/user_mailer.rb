#coding:utf-8
class UserMailer < ActionMailer::Base
  # default :from => "notify@socialdatamax.com"
  default :from => "lijinmin3903@126.com"
  default :to=> "lijinmin3903@126.com"
  def send_email(options)
  	# email = "lijinmin3903@126.com"
       email = options['email']
  	@name = options['name']
  	@phone = options['phone']
  	@email = options['email']
  	@content = options['content']
  	mail(to: email, subject: "微信留言")
  end
end