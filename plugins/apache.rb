##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.5 #
# Added module detection
##
# Version 0.4 #
# Combined Apache and Apache default pages plugins
##
Plugin.define "Apache" do
author "Andrew Horton & Brendan Coles"
version "0.5"
description "The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows NT. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards. - homepage: http://httpd.apache.org/"

# 190 results for intitle:"Test Page for Apache Installation" @ 2010-10-26
# About 8146697 ShodanHQ results for "server: Apache" @ 2010-10-26
examples %w|
www.eu.archive.org
121.72.245.103
202.89.39.193
113.21.226.227
commgrad.uky.edu
mworlds.lbl.gov
www.nhls.gov.za
https://ls.berkeley.edu
174.132.146.118
62.183.43.9
72.245.251.34
77.104.156.195
76.74.247.227
67.227.193.19
173.225.80.12
130.206.76.199
203.27.92.33
69.163.142.76
209.237.234.71
122.117.86.79
64.91.244.64
96.9.55.205
77.91.206.23
206.251.255.137
84.40.53.47
66.118.165.57
66.194.79.90
219.94.214.128
74.53.210.56
69.161.152.1
46.43.50.77
109.123.83.175
208.43.51.173
209.90.225.114
174.123.148.250
208.43.165.236
174.36.241.50
129.121.100.8
|

matches [

# Default page # Default title
{:text=>"<title>Test Page for Apache Installation</title>", :string=>"Default" },
{:text=>"<TITLE>Test Page for the SSL/TLS-aware Apache Installation on Web Site</TITLE>", :string=>"Default" },

# Default page # Default HTML
{:text=>"<html><body><h1>It works!</h1></body></html>", :string=>"Default" },
{:text=>"<html>Apache is functioning normally</html>", :string=>"Default" },
{:name=>"This IP is being shared among many domains.", 
:text=>"<body><center>This IP is being shared among many domains.<br>\nTo view the domain you are looking for, simply enter the domain name in the location bar of your web browser.<br>", :string=>"Default" },

# Shortcut Icon # Apache on Redhat
{ :url=>"/favicon.ico", :md5=>"71e30c507ca3fa005e2d1322a5aa8fb2" },

# Shortcut Icon # Apache (seen on CentOS/Debian/Fedora)
{ :url=>"/favicon.ico", :md5=>"dcea02a5797ce9e36f19b7590752563e" },

# Shortcut Icon # Apache on Red Hat/Fedora
{ :url=>"/favicon.ico", :md5=>"d99217782f41e71bcaa8e663e6302473" },

# Shortcut Icon # Apache Tomcat
{ :url=>"/favicon.ico", :md5=>"4644f2d45601037b8423d45e13194c93" },

]

# HTTP Header
def passive
	m=[]

	# Server
	m << { :name=>"HTTP Server Header" } if @meta["server"].to_s =~ /[^\r^\n]*Apache[^\r^\n]*/i

	# Version detection
	m << { :version=>@meta["server"].to_s.scan(/[^\r^\n]*Apache\/([\d\.]+)[^\r^\n]*/i) } if @meta["server"].to_s =~ /[^\r^\n]*Apache\/([\d\.]+)[^\r^\n]*/i

	# About 2172233 ShodanHQ results for "server: mod_ssl"
	m << { :module=>"mod_ssl/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_ssl\/([\d\.]+)[^\s^\r^\n]*/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_ssl\/([\d\.]+)[^\s^\r^\n]*/i

	# About 691816 ShodanHQ results for "server: mod_auth_passthrough"
	m << { :module=>"mod_auth_passthrough/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_auth_passthrough\/([\d\.]+)[^\s^\r^\n]*/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_auth_passthrough\/([\d\.]+)[^\s^\r^\n]*/i

	# About 753880 ShodanHQ results for "server: mod_bwlimited"
	m << { :module=>"mod_bwlimited/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_bwlimited\/([\d\.]+)[^\s^\r^\n]*/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_bwlimited\/([\d\.]+)[^\s^\r^\n]*/i

	# About 177808 ShodanHQ results for "Server: mod_jk"
	m << { :module=>"mod_jk/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_jk\/([\d\.]+)[^\s^\r^\n]*/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_jk\/([\d\.]+)[^\s^\r^\n]*/i

	# About 25076 ShodanHQ results for "Server: mod_fcgid"
	m << { :module=>"mod_fcgid/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_fcgid\/([\d\.]+)[^\s^\r^\n]*/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_fcgid\/([\d\.]+)[^\s^\r^\n]*/i

	# About 165191 ShodanHQ results for "Server: mod_log_bytes"
	m << { :module=>"mod_log_bytes/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_log_bytes\/([\d\.]+)[^\s^\r^\n]*/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_log_bytes\/([\d\.]+)[^\s^\r^\n]*/i

	# About 75655 ShodanHQ results for "Server: mod_gzip"
	m << { :module=>"mod_gzip/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_gzip\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_gzip\/([^\s^\r^\n]+)/i

	# About 559 ShodanHQ results for "Server: mod_security"
	m << { :module=>"mod_security/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_security\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_security\/([^\s^\r^\n]+)/i

	# About 450117 ShodanHQ results for "Server: mod_perl"
	m << { :module=>"mod_perl/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_perl\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_perl\/([^\s^\r^\n]+)/i

	# About 154334 ShodanHQ results for "Server: mod_python"
	m << { :module=>"mod_python/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_python\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_python\/([^\s^\r^\n]+)/i

	# About 87454 ShodanHQ results for "Server: mod_fastcgi"
	m << { :module=>"mod_fastcgi/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_fastcgi\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_fastcgi\/([^\s^\r^\n]+)/i

	# About 45696 ShodanHQ results for "Server: mod_psoft_traffic"
	m << { :module=>"mod_psoft_traffic/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_psoft_traffic\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_psoft_traffic\/([^\s^\r^\n]+)/i

	# About 34854 ShodanHQ results for "Server: mod_macro"
	m << { :module=>"mod_macro/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_macro\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_macro\/([^\s^\r^\n]+)/i

	# About 61692 ShodanHQ results for "Server: mod_throttle"
	m << { :module=>"mod_throttle/"+@meta["server"].to_s.scan(/[^\r^\n]*mod_throttle\/([^\s^\r^\n]+)/i).to_s } if @meta["server"].to_s =~ /[^\r^\n]*mod_throttle\/([^\s^\r^\n]+)/i

	m

end

end

