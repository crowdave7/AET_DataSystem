"""
Created on Mon Jul 22 11:21:51 2019

@author: David
"""

file = open('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\COSMOS-UK_SiteList.txt', 'r')

site_lists = [i for i in file]

site_lists = [filter(str.isalpha, i) for i in site_lists]

print sorted(site_lists)

print len(site_lists)

for i in site_lists:
    
     file = open("P:\NEC07123 NERC-RP Innovation ENTRAIN\AET_DataSystem\Processing\FileConversions\ENTRAIN_"+str(i)+"_EP.txt", "w")
        
     file.write("CD /d \"P:\\NEC07123 NERC-RP Innovation ENTRAIN\AET_DataSystem\Processing\EddyPro\\"+str(i)+"\\bin\"\n")
     
     file.write("\"P:\\NEC07123 NERC-RP Innovation ENTRAIN\AET_DataSystem\Processing\EddyPro\\"+str(i)+"\\bin\\eddypro_rp.exe\"")

     file.close()
