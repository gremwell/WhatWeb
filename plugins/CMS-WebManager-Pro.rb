##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-10 #
# Updated version detection
##
Plugin.define "CMS-WebManager-Pro" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.2"
description "CMS WebManager-Pro - is a software product for creating and maintaining websites of any complexity. - homepage: http://webmanager-pro.com/"

# 2 results for "powered by CMS WebManager-Pro" @ 2010-09-04

# Examples #
examples %w|
www.21.com.ua
|

# Matches #
matches [

	# Powered by text
	{ :text=>'Powered by <a style="color:#555555;" href="http://webmanager-pro.com/">CMS Webmanager-pro</a>' },

	# Version detection # Meta generator
	{ :version=>/<meta name="generator" content="Webmanager-pro v([\d\.]+)" \/>/, :regexp_offset=>0 },

]

end

