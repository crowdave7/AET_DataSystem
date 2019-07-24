# -*- coding: utf-8 -*-
"""
Created on Wed Jul 24 09:14:02 2019

@author: davcro
"""

text_file = open('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\COSMOS-UK_SiteList.txt', 'r')

site_lists = [i for i in text_file]

site_lists = [filter(str.isalpha, i) for i in site_lists]

site_lists = sorted(site_lists)

# =============================================================================
  # REPLACE BALRD WITH SITE NAME IN METADATA FILE

# for i in site_lists:
#     
#     with open("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini\\"+str(i)+".metadata", 'r') as file:
#         filedata = file.read()
#     
#     filedata = filedata.replace('BALRD', str(i))
#  
#     with open("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini\\"+str(i)+".metadata", 'w') as file:
#         file.write(filedata)
#         
# =============================================================================
  
# REPLACE BALRD / EUSTN WITH SITE NAME IN PROCESSING.EDDYPRO FILE
  
for i in site_lists:
    
    with open("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini\\processing.eddypro", 'r') as file:
        filedata = file.read()
        
    filedata = filedata.replace('BALRD', str(i))
    filedata = filedata.replace('EUSTN', str(i))
    
    print filedata
    
    with open("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini\\processing.eddypro", 'w') as file:
        file.write(filedata)
  
