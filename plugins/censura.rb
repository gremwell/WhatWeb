##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-09 #
# Updated version detection
##
Plugin.define "Censura" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.2"
description "Censura - the flexible, robust, reviews and ratings application. - homepage: http://www.censura.info/"

# 70 results for "Powered by: Censura" @ 2010-08-01

# Examples #
examples %w|
www.censurademo.com
www.astronomyforbeginners.com/reviews/
www.dwuog.com/reviews/
omahasrestaurants.com
www.n0hr.com/HamRadioReviews/
usa-hotelguide.com
americacoasters.com/database/
www.coindealerratings.com/reviews/
chestsurgeryproject.org
ratearealtor.org
www.ratemycaseworker.net
ghostreviews.com
www.beauty-mania.rs/censura/
ees24.de
holidayscore.com
sinekitap.com
soutak.com/user/
nappyreviews.com
www.archerytalkreviews.com/reviews/
www.bikesuperhub.com/reviews/
|

# Matches #
matches [

	# Version Detection # Powered by footer
	# The "brand removal" option is a one-off fee per license. There is a link within your client area to allow you to purchase a "brand removal" option.
	# http://www.censura.info/support/kb/article/000001
	{ :version=>/Powered by: <a[^>]* href="http:\/\/www.censura.info">Censura<\/a> version ([\d\.]+)/, :regexp_offset=>0 },

]

end

