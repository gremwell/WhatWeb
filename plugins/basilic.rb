##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-08 #
# Updated version detection
##
Plugin.define "Basilic" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-14
version "0.2"
description "Basilic is a bibliography server for research laboratories. It automates and facilitates the diffusion of research publications over the internet, automatically generating web pages from a publication database. - homepage: http://artis.imag.fr/Software/Basilic"

# 14 results for "powered by basilic" @ 2010-08-14

# Examples #
examples %w|
www.lifl.fr/GRAPHIX/publications.php
secure.ntsg.umt.edu/publications/
www.liaad.up.pt/pub/
www.inis.iarc.uaf.edu/publications/
|

# Matches #
matches [

	# Powered by text
	{ :text=>"Powered by <a href='http://artis.imag.fr/Software/Basilic/'>Basilic</a></p>" },
	{ :text=>"<a href='http://artis.imag.fr/Software/Basilic'>Powered by Basilic</a></span>" },

	# Version Detection # Powered by footer text
	{ :version=>/<span>Powered by <a href='http:\/\/artis.imag.fr\/Software\/Basilic'>Basilic ([\d\.]+)<\/a><\/span>/, :regexp_offset=>0 },
	{ :version=>/<a href='http:\/\/artis.imag.fr\/Software\/Basilic'[^>]+>&copy; Powered by Basilic ([\d\.]+)/, :regexp_offset=>0 },

]

end

