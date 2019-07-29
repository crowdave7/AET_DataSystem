#FOR EACH SITE, 
#READ BLANK METADATA FILE
# ADD METADATA FROM COSMOS-UK METADATA CSV
# SAVE IN SITE INI FOLDER
# READ BLANK PROCESSING.EDDYPRO FILE
# ADD INFO / LINKS TO FILE
# SAVE IN SITE INI FOLDER

df <- read.csv("P:\\NEC04961_COSMOSUK\\Instrumentation\\COSMOS-UK_metadata.csv", header=TRUE)
df[is.na(df)] <- " "

site_names <- df$SITE_NAME
site_ids <- df$SITE_ID
latitudes <- df$LATITUDE
longitudes <- df$LONGITUDE
altitudes <- df$ALTITUDE
instr_1_sw_versions <- df$INSTR_1_SW_VERSION
instr_1_ids <- df$INSTR_1_ID

# EDDY PRO METADATA FILE

for (i in seq(1, length(site_names))) {
  
  site_name <- site_names[i]
  site_id <- site_ids[i]
  altitude <- altitudes[i]
  latitude <- latitudes[i]
  longitude <- longitudes[i]
  instr_1_sw_version <- instr_1_sw_versions[i]
  instr_1_id <- instr_1_ids[i]
  file_name <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Processing/EddyPRO/%s/ini/%s.metadata', site_id, site_id)
  
  strings = list('site_name', 'site_id', 'altitude', 'latitude', 'longitude', 'instr_1_sw_version', 'instr_1_id', 'file_name')
  variables <- list(site_name, site_id, altitude, latitude, longitude, instr_1_sw_version, instr_1_id, file_name)
  
  count = 1
  
  file <- readLines('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\BLANK.metadata')
  
  for (j in variables) {
    
    string <- strings[count]
    
    filedata <- gsub(pattern = sprintf('%s=', string), replace = sprintf('%s=%s', string, j), x = file)
    
    writeLines(filedata, con=sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\%s.metadata', site_id, site_id))
    
    file <- readLines(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\%s.metadata', site_id, site_id))
    
    count = count + 1
  }
  
}

# EDDYPRO PROCESSING.EDDYPRO FILE

for (i in seq(1, length(site_names))) {
  
  site_id <- site_ids[i]
  file_name <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Processing/EddyPRO/%s/ini/processing.eddypro', site_id)
  project_id <- sprintf('%s_EPv6.1', site_id)
  file_prototype <- sprintf('TOA5_%s_FluxRaw_yyyy_mm_dd_HHMM.dat', site_id)
  proj_file <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Processing/EddyPRO/%s/ini/%s.metadata', site_id, site_id)
  out_path <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Data/EddyPRO_Output/%s', site_id)
  biom_file <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Data/Biomet/%s/%s_Biomet_Data.csv', site_id, site_id)
  data_path <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Data/Fast/%s/NowProc', site_id)
  
  strings = list('site_id', 'file_name', 'project_id', 'file_prototype', 'proj_file', 'out_path', 'biom_file', 'data_path')
  variables <- list(site_id, file_name, project_id, file_prototype, proj_file, out_path, biom_file, data_path)
  
  count = 1
  
  file <- readLines('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\processing.eddypro')
  
  for (j in variables) {
    
    string <- strings[count]
    
    filedata <- gsub(pattern = sprintf('%s=', string), replace = sprintf('%s=%s', string, j), x = file)
    
    writeLines(filedata, con=sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\processing.eddypro', site_id))
    
    file <- readLines(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\processing.eddypro', site_id))
    
    count = count + 1
  }
  
}