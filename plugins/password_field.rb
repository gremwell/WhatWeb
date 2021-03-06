##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "PasswordField" do
author "Caleb Anderson"
version "0.1"
description "find password fields"

examples %w|www.twitter.com  www.facebook.com|

matches [
{:name=>"rss link type",
:regexp=>/<input [^>]*?type=["']password["'].*?>/i
},

]

def passive
    m=[]
    fields=@body.scan(/<input [^>]*?type=["']password["'].*?>/i)
    fields.each do |field|
        name=field.scan(/name=["'](.*?)["']/i).first.first rescue nil
        m << {:name=>"field name",:string=>name} unless name.nil?
    end
    return m
end


end


