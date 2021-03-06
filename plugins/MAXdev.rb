##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MAXdev" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "MaxDev is proud to introduce MD-Pro, the most complete, flexible and reliable CMS available on the market. - homepage: http://www.maxdev.com/AboutMD.phtml"

# 64 results for "powered by MAXdev" @ 2010-08-28
examples %w|
demo.opensourcecms.com/mdpro/
demaciro.altervista.org
www.maxdev.it
www.maxdev.com.au
www.maxdevitalia.com
www.fclefbasses.com
www.cavalierismoa.net
www.filcemcgil.it
www.ciclismofriuli.it
www.web-design.pointnet.it
www.giacomobracci.com
www.canelupocecoslovacco.net/wolf/
www.boidi.it
www.lekamar.com
www.salottiscultore.info
www.cavalierismoa.it
www.invention-europe.com
www.pattininews.it/summa/
www.cucinet.com
www.icmonteronidarbia.it
www.maxsos.it
www.lauraproperzi.it
www.passionecacciaepesca.net
www.discuniroma1.it/comland/
www.parrocchiasangaetanoroma.it
www.maresub.it
www.ceasicani.it
www.pippy.it
www.framemods.com
www.leonellocalvetti.com
www.mcvallescrivia.com
www.fclefstore.com
www.apoolgame.com
|

matches [

# DB Error page
{ :text=>'<a href="language/eng/dbfail.html" style="text-decoration: none;">MAXdev - Problem in Database Connection: click here to read more...</a>' },

# Powered by text
{ :text=>'<a href="http://www.maxdev.it" target="_blank">Powered by MAXDev</a>' },
{ :regexp=>/<div class="poweredtext"><a href="javascript:opencredits\(\)">Credit[i|s]+<\/a> <a href="http:\/\/www.maxdev[.it|italia.com]+">Powered by MAXdev<\/a><\/div>/ },

# HTML comments
{ :text=>'************** MAXdev - MAXdev (http://www.maxdev.it) ***********' },
{ :text=>'************** MAXdev - MAXdev (http://www.maxdev.com) ***********' },

# Default logo
{ :md5=>'0caf204c07776c652de251a1eb74447a', :url=>'images/logo.gif' }

]

# Version detection using meta generator
def passive
        m=[]

        if @body =~ /<meta name="generator" content="MAXdev ([\d\.]+) - http:\/\/www.maxdev.[com|it]*">/
                version=@body.scan(/<meta name="generator" content="MAXdev ([\d\.]+) - http:\/\/www.maxdev.[com|it]*">/)[0][0]
                m << {:version=>version}
        end

        m

end


end

