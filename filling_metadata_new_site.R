# READ IN COSMOS CSV FILE

df <- read.csv("P:\\NEC04961_COSMOSUK\\Instrumentation\\COSMOS-UK_metadata.csv", header=TRUE)
df[is.na(df)] <- " "

# READ IN METADATA FROM CSV FILE

site_names <- df$SITE_NAME
site_ids <- df$SITE_ID
latitudes <- df$LATITUDE
longitudes <- df$LONGITUDE
altitudes <- df$ALTITUDE
instr_1_sw_versions <- df$INSTR_1_SW_VERSION
instr_1_ids <- df$INSTR_1_ID

# FOR EACH SITE

for (i in seq(1, length(site_names))) {
  
  # IF SITE DIRECTORY EXISTS, DO NOTHING
  
  site_id <- site_ids[i]
  
  test <- dir.exists(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s', site_id))
  
  if (test) {
    
  # IF SITE DIRECTORY DOES NOT EXIST
    
  } else {
    
    # MAKE PROCESSING \ EDDYPRO \ SITE_ID \ BIN DIRECTORY & FILL WITH BIN FILES--------------------------------------------
    
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\', site_id))
    
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\bin', site_id))
    
    current_folder <- "P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\BinFiles"
    
    bin_files <- list.files("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\BinFiles")
    
    file.copy(file.path(current_folder, bin_files), sprintf("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\bin", site_id))
    
    # MAKE PROCESSING \ EDDYPRO \ SITE_ID \ INI DIRECTORY-----------------------------------------------------------------

    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini', site_id))

    # MAKE EDDYPRO METADATA FILE & ADD TO INI -------------------------------------------------------------
    
    site_name <- site_names[i]
    altitude <- altitudes[i]
    latitude <- latitudes[i]
    longitude <- longitudes[i]
    instr_1_sw_version <- instr_1_sw_versions[i]
    instr_1_id <- instr_1_ids[i]
                              
    file_name <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Processing/EddyPRO/%s/ini/%s.metadata', site_id, site_id)
    
    strings_metadata <- list('site_name', 'site_id', 'altitude', 'latitude', 'longitude', 'instr_1_sw_version', 'instr_1_id', 'file_name')
    variables_metadata <- list(site_name, site_id, altitude, latitude, longitude, instr_1_sw_version, instr_1_id, file_name)
    
    count = 1
    
    file <- readLines('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\BLANK.metadata')
    
    for (j in variables_metadata) {
      
      string <- strings_metadata[count]
      
      filedata <- gsub(pattern = sprintf('%s=', string), replace = sprintf('%s=%s', string, j), x = file)
      
      writeLines(filedata, con=sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\%s.metadata', site_id, site_id))
      
      file <- readLines(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\%s.metadata', site_id, site_id))
      
      count = count + 1
    }                          

    # MAKE EDDYPRO PROCESSING.PRO FILE & ADD TO INI --------------------------------------------------------
    
    site_id <- site_ids[i]
    file_name <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Processing/EddyPRO/%s/ini/processing.eddypro', site_id)
    project_id <- sprintf('%s_EPv6.1', site_id)
    file_prototype <- sprintf('TOA5_%s_FluxRaw_yyyy_mm_dd_HHMM.dat', site_id)
    proj_file <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Processing/EddyPRO/%s/ini/%s.metadata', site_id, site_id)
    out_path <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Data/EddyPRO_Output/%s', site_id)
    biom_file <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Data/Biomet/%s/%s_Biomet_Data.csv', site_id, site_id)
    data_path <- sprintf('P:/NEC07123 NERC-RP Innovation ENTRAIN/AET_DataSystem/Data/Fast/%s/NowProc', site_id)
    
    strings_processing <- list('site_id', 'file_name', 'project_id', 'file_prototype', 'proj_file', 'out_path', 'biom_file', 'data_path')
    variables_processing <- list(site_id, file_name, project_id, file_prototype, proj_file, out_path, biom_file, data_path)
    
    count = 1
    
    file <- readLines('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\processing.eddypro')
    
    for (j in variables_processing) {
      
      string <- strings_processing[count]
      
      filedata <- gsub(pattern = sprintf('%s=', string), replace = sprintf('%s=%s', string, j), x = file)
      
      writeLines(filedata, con=sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\processing.eddypro', site_id))
      
      file <- readLines(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPRO\\%s\\ini\\processing.eddypro', site_id))
      
      count = count + 1
    }
    
    # ADD SITE ID TO COSMOS-UK SITE LIST ------------------------------------------------------------------------------------
    
    file_to_append <- file("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\COSMOS-UK_SiteList.txt","a")
    
    write(sprintf('\n\"%s\"', site_id), file=file_to_append,append=TRUE)
    
    file_to_read <- readLines("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\COSMOS-UK_SiteList.txt", skipNul= TRUE) 
    
    file_no_blank_lines <- file_to_read[sapply(file_to_read, nchar) > 0]
    
    file_to_overwrite <- file("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\COSMOS-UK_SiteList.txt")
    
    writeLines(file_no_blank_lines, file_to_overwrite)
    
    closeAllConnections()
    
    
    # CREATE TEXT FILE (FOR CONVERSION TO BATCH LATER) ----------------------------------------------------------------------
    
    line_1 <- sprintf("CD /d \"P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPro\\%s\\bin\"", site_id)
    
    line_2 <- sprintf("\"P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\EddyPro\\%s\\bin\\eddypro_rp.exe\"", site_id)
    
    text <- c(line_1, line_2) 
    
    writeLines(text, sprintf("P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Processing\\FileConversions\\ENTRAIN_%s_EP.txt", site_id))
    
    # CREATE FOLDER TO STORE BIOMET DATA ------------------------------------------------------------------------------------
    
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Data\\Biomet\\%s', site_id))
    
    # CREATE FOLDER TO STORE EDDYPRO OUTPUT ---------------------------------------------------------------------------------
    
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Data\\EddyPRO_Output\\%s', site_id))
    
    # CREATE FAST DATA FOLDERS ----------------------------------------------------------------------------------------------
    
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Data\\Fast\\%s', site_id))
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Data\\Fast\\%s\\NowProc', site_id))
    dir.create(sprintf('P:\\NEC07123 NERC-RP Innovation ENTRAIN\\AET_DataSystem\\Data\\Fast\\%s\\Processed', site_id))
    
  }
}




