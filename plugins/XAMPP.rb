##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-24 #
# Updated version detection
# Added match for 403 error page
##
Plugin.define "XAMPP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-21
version "0.2"
description "XAMPP is an easy to install Apache distribution containing MySQL, PHP and Perl. XAMPP is really very easy to install and to use - just download, extract and start. - homepage: http://www.apachefriends.org/en/xampp.html"

# Search results as of 2011-01-21 :
# About 21,462 ShodanHQ results for location xampp
# 15 Google results for "You have successfully installed XAMPP on this system!" intitle:"XAMPP Version"
# 2 Google image results for inurl:"head-macosx.gif" xampp
# 3 Google image results for inurl:"head-windows.gif" xampp

# Examples #
examples %w|
https://www.funproins.com
abc.fohow.com
clnedge.com/xampp/
bestwater24.net/xampp/
www.quangtri.vnpost.vn/xampp/
www.bukovyna.cv.ua
www.st.msu.ac.th
www.kingdom-ro.com
www.rimari.net/xampp/
62.244.85.119
202.51.190.50
78.46.143.1
110.55.252.143
91.23.95.10
50.16.201.27
84.150.168.132
128.101.110.7
193.111.208.220
94.22.67.96
|

# Matches #
matches [

	# Default meta author
	{ :text=>'<meta name="author" content="Kai Oswald Seidler">', :certainty=>75 },

	# Version Detection # Default title
	{ :version=>/<title>XAMPP Version ([^\r^\n^<]+)[\s]*<\/title>/, :regexp_offset=>0 },

	# OS Detection # Default title
	{ :module=>/<title>XAMPP for ([^\r^\n^<]{5,8}) [\d\.a-z]{3,6}[\s]*<\/title>/, :regexp_offset=>0 },

	# Windows # Default logo
	{ :url=>"img/head-windows.gif", :md5=>"567ebe64625942cbb8244eca918b06a0", :string=>"OS:Windows" },

	# Linux # Default logo
	{ :url=>"img/head-linux.jpg", :md5=>"bca095ec432fe08f90866d2e6c149590", :string=>"OS:Linux" },

	# Mac OSX # Default logo
	{ :url=>"img/head-macosx.gif", :md5=>"1fbd850a328026104cd7caa9e3bdaf4e", :string=>"OS:Mac OSX" },
	{ :url=>"img/head-macosx.gif", :md5=>"df859a3c31b7ed2b75d78f78889107b2", :string=>"OS:Mac OSX" },

	# Solaris # Default logo
	{ :url=>"img/head-solaris.gif", :md5=>"b18490e1a42d7293cbca353100d6d787", :string=>"OS:Solaris" },

	# 403 Error page
	{ :text=>'<p style="margin-left: 2.6em; font-size: 1.2em; color: red;">New XAMPP security concept:</p>' },

]

# Passive #
def passive
	m=[]

	# HTTP Redirect Location #
	m << { :certainty=>25 } if @meta["location"] =~ /^http:\/\/[\d\.a-z]{1,256}\/xampp\/$/i

	m
end

# An aggressive plugin can get more details from :
# /xampp/start.php	# Operating System
# /xampp/phpinfo.php	# phpinfo()
# /xampp/navi.php	# Installed Apps (phpMyAdmin, Webalizer, FileZilla, etc)

# Aggressive #
def aggressive
	m=[]

	# Extract details from /phpinfo.php
	target = URI.join(@base_uri.to_s,"/xampp/phpinfo.php").to_s
	status,url,ip,body,headers=open_target(target)

	# Check if the document is a valid XAMPP phpinfo() page
	if body =~ /<title>phpinfo\(\)<\/title>/ and body =~ /XAMPP/i and (body =~ /<h1 class="p">PHP Version [^<]{3,40}<\/h1>/ or body =~ /<h1>PHP Version [^<]{3,40}<\/h1>/)

		# Extract PHP Version
		m << { :string=>"PHP:"+body.scan(/<h1 class="p">PHP Version ([^<]{3,40})<\/h1>/)[0].to_s } if body =~ /<h1 class="p">PHP Version [^<]{3,40}<\/h1>/
		m << { :string=>"PHP:"+body.scan(/<h1>PHP Version ([^<]{3,40})<\/h1>/)[0].to_s } if body =~ /<h1>PHP Version [^<]{3,40}<\/h1>/

		# OS Detection
		m << { :string=>"OS:"+body.scan(/<tr><td class="e">System <\/td><td class="v">([^<]{4,256})[\s]?<\/td><\/tr>/)[0].to_s } if body =~ /<tr><td class="e">System <\/td><td class="v">[^<]{4,256}[\s]?<\/td><\/tr>/

	end

	m
end

end

