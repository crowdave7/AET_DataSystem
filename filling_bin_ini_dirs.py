# -*- coding: utf-8 -*-
"""
Created on Tue Jul 23 14:40:02 2019

@author: davcro
"""

import os
import shutil

# THIS SCRIPT FILLS THE BIN AND INI DIRECTORIES FOR EACH SITE READY FOR EDDYPRO PROCESSING 
# AFTER RUNNING, MUST CHANGE TEXT WITHIN METADATA AND PROCESSING.EDDYPRO FILES TO LINK TO EACH SITE (SEPARATE SCRIPT)

#file = open('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\test.txt', 'r')

file = open('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\COSMOS-UK_SiteList.txt', 'r')

site_lists = [i for i in file]

site_lists = [filter(str.isalpha, i) for i in site_lists]

# =============================================================================

# SETTING UP BIN AND INI DIRECTORIES: DONE

# for i in site_lists:
# 
#     bin_folder = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\bin"
#     
#     if not os.path.exists(bin_folder):
#         os.makedirs(bin_folder)
#     
#     ini_folder = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini"
#     
#     if not os.path.exists(ini_folder):
#         os.makedirs(ini_folder)


# =============================================================================

# COPYING BIN FILES INTO EVERY BIN FOLDER: DONE
# 
# folder = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\BALRD\\bin"
# 
# source_files = os.listdir(folder)
# 
# print source_files
# 
# for i in site_lists:
#     
#     destination = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\bin"
# 
#     for j in source_files:
#         
#         full_path = os.path.join(folder, j)
#         
#         print full_path
#         
#         if os.path.isfile(full_path):
#             shutil.copy(full_path, destination)


# =============================================================================

# COPYING BALRD processing.pro FILE TO EVERY INI FOLDER: DONE

# processing_pro_file = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\BALRD\\ini\\processing.eddypro"
# 
# for i in site_lists:
#     
#     destination = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini"
#     
#     shutil.copy(processing_pro_file, destination)
#     
#     print "done"

# =============================================================================

# COPYING BALRD BALRD.metadata FILE TO EVERY INI FOLDER : DONE

# metadata_file = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\BALRD\\ini\\BALRD.metadata"
# 
# for i in site_lists:
#     
#     destination = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini"
#  
#     shutil.copy(metadata_file, destination)
#     
#     print "done"
# =============================================================================

# RENAMING METADATA FILES FOR EACH SITE: DONE
# 

# site_lists = sorted(site_lists)
# 
# for i in site_lists:
#  
#     file_to_rename = "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini\\BALRD.metadata"
#     
#     os.rename(file_to_rename, "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+str(i)+"\\ini\\"+str(i)+".metadata")
#     
#
# =============================================================================


        