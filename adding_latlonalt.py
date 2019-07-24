# -*- coding: utf-8 -*-
"""
Created on Wed Jul 24 11:29:13 2019

@author: davcro
"""

#SCRIPT READS LAT/LON/ALT DATA FROM CSV AND ADDS TO METADATA FOR EACH SITE

import numpy as np

data = np.genfromtxt("P:\NEC04961_COSMOSUK\Instrumentation\COSMOS-UK_lat_long_alt.csv", delimiter=',', unpack=True, names=True, dtype=(object, object, float, float, int))

site_names = data['SITE_NAME']

site_ids = data['SITE_ID']

latitudes = data['LATITUDE']

longitudes = data['LONGITUDE']

altitudes = data['ALTITUDE']

for i in np.arange(0, len(site_names)):
    site_name = site_names[i]
    site_id = site_ids[i]
    altitude = altitudes[i]
    latitude = latitudes[i]
    longitude = longitudes[i]
    
    with open("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+site_id+"\\ini\\"+site_id+".metadata", 'r') as file:
        filedata = file.read()
               
    filedata = filedata.replace('site_name=', 'site_name='+str(site_name)+'')
    filedata = filedata.replace('site_id=', 'site_id='+str(site_id)+'')
    filedata = filedata.replace('altitude=5.0', 'altitude='+str(altitude)+'')
    filedata = filedata.replace('latitude=0', 'latitude='+str(latitude)+'')
    filedata = filedata.replace('longitude=0', 'longitude='+str(longitude)+'')
    
    print filedata
    
    with open("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\"+site_id+"\\ini\\"+site_id+".metadata", 'w') as file:
        file.write(filedata)
