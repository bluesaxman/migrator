#check for exsistance of ~/Movingout_dir
if [ -e ~/Movingout_dir ]; then
        #if its there clean up first by rm -rf ~/Movingout_dir
        rm -rf ~/Movingout_dir
fi

CPANEL () {
#function CPANEL
echo "Looks like we have a cpanel here!"
#determin what domains are here, and where their webroots are and create a manifest.txt of the domains in ~/Movingout_dir/
#tar each webroot in a tar withthe domain as the name in ~/Movingout_dir/
#determin what databases are here, and dump each one to a databasename.sql in ~/Movingout_dir/databases/
#determin what email accounts live here, and change all passwords to a preset key
#make a text file with a list of the email addresses and the preset key stored in ~/Movingout_dir/emails/
#END function
}

#Determine environment (Is it cpanel?)
if [ -e ~/.cpanel ]; 
        then CPANEL
#if cpanel, do cpanel packaging steps using API (see pseudo function CPANEL)
        else
#else try to determin what domains are hosted here (do we have access to apache?)
        #can we apache things?
        if [ -r /etc/apache2/apache2.conf ]; then
        fi
        #can we httpd things?
        if [ -r /etc/httpd/conf/httpd.conf ]; then
                #this need to be stored somwhere
                DOMAININFO= cat /etc/httpd/conf/httpd.conf | grep -v "#" | egrep -i "Documentroot|ServerName" | awk '!(NR%2){print p" "$2}{p=$2}'
        fi
#       add any domains found to ~/Movingout_dir/manifest.txt along with their webroots
#       tar each domains webroot in a tar with the domain as the name in ~/Movingout_dir/
#       determin using mysql command what databases are here, store the information in ~/Movingout_dir/databases/manifest.txt
#       dump each database to databasename.sql in ~/Movingout_dir/databases/
#       determin if an MTA and MDA are running here
#               Yes -   Determin email accounts and list them in with a preset key ~/Movingout_dir/emails/manifest.txt
#                       Use MDA to change each email accounts password to preset key
#               No  -   Create blank manifest file in ~/Movingout_dir/emails/manifest.txt
#end else
fi

#function CPANEL
#determin what domains are here, and where their webroots are and create a manifest.txt of the domains in ~/Movingout_dir/
#tar each webroot in a tar withthe domain as the name in ~/Movingout_dir/
#determin what databases are here, and dump each one to a databasename.sql in ~/Movingout_dir/databases/
#determin what email accounts live here, and change all passwords to a preset key
#make a text file with a list of the email addresses and the preset key stored in ~/Movingout_dir/emails/
#END function

#Finish packing
#tar ~/Movingout_dir to MovingTruck.tar.gz in ~/
#rm -rf ~/Movingout_dir

#signal migrator.sh that packaging is complete.
#I'm thinking with a "complete" file that has some information about MovingTruck.tar.gz such as size and content.
#Any errors will also go in here.
