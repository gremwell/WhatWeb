##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Updated version detection. Added OS extraction.
##
Plugin.define "phpSysInfo" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.2"
description "PHPSysInfo is a customizable PHP Script that parses /proc, and formats information nicely. It will display information about system facts like Uptime, CPU, Memory, PCI devices, SCSI devices, IDE devices, Network adapters, Disk usage, and more. - homepage:http://phpsysinfo.sourceforge.net/"

# About 16,400 results for "Created by phpSysInfo" @ 2010-06-09
examples %w|
phpsysinfo.sourceforge.net/phpsysinfo/
fountainalleylofts.com
www.sanjoseurbanliving.com
www.japantownliving.com
www.sanjoseurban.com
oneeastjulian.com
paloaltolofts.com
www.thewalnutfactorylofts.com
www.plant51lofts.com
sunnyvalelofts.com
gothenburg.homelinux.com/phpsysinfo/
sys.onzin.org
www.rob-smith.co.uk/phpsysinfo/
www.invinciblehost.com/phpSysInfo/
www.viperxx.net/phpsysinfo/
coreybarker.net/phpsysinfo/
www.rserve.biz/phpsysinfo/
www.pinakothek.de/phpsysinfo/
www.lnxgeek.com/phpsysinfo/
tacanahosting.com/phpsysinfo/
http://www.leadingit.net/phpsysinfo/
https://grosjo.net/sysinfo/
hm1.hostpeek.com/phpsysinfo/
www.bartbaars.nl/phpsysinfo/
www.resellerdomain.org/status/phpsysinfo/
vdr.qlex.org
whizzcats.com/sysinfo/
protcluster.biotec.or.th/phpSysInfo/
cbrc.musc.edu/phpSysInfo/
|

matches [

# GHDB Match
{ :ghdb=>'"Created by phpSysInfo"', :certainty=>25 },

# Redirect page # Default JavaScript
{ :text=>'var sTargetURL = "index.php?disp=dynamic";' },

# Version detection # Redirect page # Generated by text
{ :version=>/Generated by[\s&nbsp;]*<a href="http:\/\/phpsysinfo.sourceforge.net[^>]*>[\s&nbsp;]*phpSysInfo[\s&nbsp;]*-[\s&nbsp;]*([^<]+)<\/a>/, :regexp_offset=>0 },

# Version detection # Redirect page # Created by text
{ :version=>/Created by[\s&nbsp;]*<a href="http:\/\/phpsysinfo.sourceforge.net[^>]*>[\s&nbsp;]*phpSysInfo[\s&nbsp;]*-[\s&nbsp;]*([^<]+)<\/a>/, :regexp_offset=>0 },

# Version detection # index.php?disp=static # Created by text
{ :version=>/<span>Created by <\/span><a href="http:\/\/phpsysinfo.sourceforge.net\/"><span>phpSysInfo - <\/span><span>([^<]+)<\/span>/, :regexp_offset=>0 },

]

# Extract details # index.php?disp=static
def passive
	m=[]

	# Operating System
	if @body =~ /<td style="width:160px; "><span>Kernel Version<\/span><\/td><td>([^<]+)<\/td><\/tr>/
		modules=@body.scan(/<td style="width:160px; "><span>Kernel Version<\/span><\/td><td>([^<]+)<\/td><\/tr>/)
		m << { :module=>modules }
	end

	m

end

end

