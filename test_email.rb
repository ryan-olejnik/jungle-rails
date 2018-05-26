require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => '<username>',
            :password             => '<password>',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
       to 'mikel@test.lindsaar.net'
     from 'ada@test.lindsaar.net'
  subject 'testing sendmail'
     body 'testing sendmail'
end