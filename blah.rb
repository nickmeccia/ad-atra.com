require 'sendgrid-ruby'
include SendGrid

def Send_msg(body)
  from = Email.new(email: 'nickmeccia@gmail.com')
  to = Email.new(email: 'nickmeccia@gmail.com')
  subject = 'Sendgrid Email'
  content = Content.new(type: 'text/plain', value: body)
  mail = Mail.new(from, subject, to, content)
  puts ENV['SENDGRID_API_KEY']
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  sg.client.mail._('send').post(request_body: mail.to_json)
end

#body = blah
#loop {
#  if body != blah
#    response = sg.client.mail._('send').post(request_body: mail.to_json)
#    exit
#  else
#    sleep 1799
#  end
#}
