#!/usr/bin/ksh
#############################################################################
##  Description of script                                                  ##
##                                                                         ##
#############################################################################

# Break down into steps
# set hostname varrible
HSTN=`hostname`
# Create Arrays for each ENV
set -A BSA bkpc1t01pakr bkpc1t02pakr bkpnbu05pakr isbfd isbfm isbfm2 isbfp1 isbfp2 isbfp3 isbfp5 isbfp6 isbfq isbfq2 isbft isbft2 ishrp1 ishrq opmapp01pakr sapbfmdb sapbfp1db sapbfp2db sapbfq1db sapbfq2db sapbftdb sapbgd sapbgp1 sapbgp2 sapbgq sapde1 sapjvd sapjvp sappl1 sappod sappod1 sappop1 sappop1db sappop2 sappop2db sappopapp sappoq1 sappoq2 sappoqdb sappos sapsb1 sapsfd sapsfp1 sapsfp1db sapsfp2 sapsfp2db sapsfpapp sapsfqapp1 sapsfqapp2 sapsfqdb sapsld sapslp1db sapslp2db sapslq sapsmd sapsmp sp2n13 sp2n25 sxdapp1 sxdapp2 sxddb sxdrptbo sxdrptdb sxdrptds sxp1db sxp2db sxpapp1 sxpapp2 sxpapp3 sxpapp4 sxpapp5 sxprptbo sxprptdb sxprptds sxqapp1 sxqapp2 sxqapp3 sxqdb sxqrptbo sxqrptdb sxqrptds sxsapp1 sxsapp2 sxsdb sxsrptbo sxsrptdb sxsrptds
set -A BSRO hemsdev hemsprod hemsqa jdadev jdaprod jdaqa lawdev lawprod nim1 oradev oraprod twsdev twsprod yoda
set -A BSLA blis-bkp01 blis-rssap06 blis-rssap07 blis-rssap08 blis-rssap09 blis-rssap10 blis-rssap11 blis-rssap15 blis-rssap16 blis-rssap18 blis-rssap20 blis-rssap21 blis-rssap23 blis-rssap24 blis-rssap25 blis-rssap26 blis-rssap28 blis-rssap29 blis-rssap30 blis-rssap31 blis-rssap32 blis-rssap33 blis-rssap34 blis-rssap35 blis-rssap40 blis-rssap41 blis-rssap42 blis-rssap43

if [ $HSTN == "${BSA[@]}" ];
        then echo "BSA Server"
        elif [ $HSTN = ${BSRO[*]} ];
        then echo "BSRO Server"
        elif [ $HSTN = ${BSLA[*]} ];
        then echo "BSA Server"
        else echo "unknown"
fi
