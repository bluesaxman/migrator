#!//bin/sh

#does ~/FrontPorch exsist already? 
# IF so rm -rf ~/FrontPorch to clean up first. 

#untar MovingTruck.tar.gz to ~/FrontPorch/
#read Domain manifest.txt from ~/FrontPorch/ to determin the addon domains to add using cpanel API
#untar each domain.tar to its new webroot
#read Database manifest.txt from ~/FrontPorch/databases/ to determin the databases that need to be set up using API
#set up empty datavases for each database with a preset user and key which will be temporarily stored in ~/FrontPorch/doormat/<databasename>.txt
#mysql import each database into its new home. and update the mainfest withthe new name (next to the old name)

#Fix database associations
#use the manifest to grep for files calling each database
#update them with the new database name
#update them with the new user and ket from the respective doormat file

#Email time
#connect to the chi API and use the information in ~/FrontPorch/emails/ to create the email accounts in CHI
#connect to the mac tool API and use the informtaion in ~/FrontPorch/emails/ to start a migration job for the email accounts.

#Everythings moved in, clean up the front porch
#rm -rf ~/FrontPorch

#signal migrator.sh that movein.sh is complete. 
