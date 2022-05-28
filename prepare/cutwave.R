library(tuneR)
library(seewave)
library(lubridate)
library(hms)


transcript<-read.csv("/project/graziul/transcripts/transcripts2021_09_03.csv")

# from transcript file extract mp3 path (main path+zone+day+mp3name)
mp3path<-function(i,transcript){
  zonename<-transcript[i,'zone']
  wavefile<-transcript[i,'file']
  dayname<-format(as.Date(substr(wavefile,1,8),'%Y%m%d'),format="%Y_%m_%d")
  mp3name<-paste(substr(wavefile,1,24),".mp3",sep="")
  mp3path<-paste("/project/graziul/data",zonename,dayname,mp3name,sep="/")
  return(mp3path)
}

wav_save_path<-function(i,transcript){
  wavefile<-transcript[i,'file']
  mp3name<-substr(wavefile,1,24)
  timename<-gsub('[.]','',transcript[i,'start'])
  wav_save<-paste(mp3name,timename,sep="-")
  wav_name<-paste(wav_save,".wav",sep="")
  zonename<-transcript[i,'zone']
  dayname<-format(as.Date(substr(wavefile,1,8),'%Y%m%d'),format="%Y_%m_%d")
  wav_save_path<-paste("/project/graziul/ra/team_ser/data",zonename,dayname,mp3name,wav_name,sep="/")
  return(wav_save_path)
}

get_nosilence_slice<-function(i,transcript){
  mp3_path<-mp3path(i,transcript)
  mp3<-readMP3(mp3_path)
  starttime<-as_hms(parse_date_time(transcript[i,'start'],"%H.%M.%S"))
  endtime<-as_hms(parse_date_time(transcript[i,'end'],"%H.%M.%S"))
  startsecond<-minute(starttime)*60+second(starttime)
  endsecond<-minute(endtime)*60+second(endtime)
  audio_nosilence<-extractWave(mp3,from = minute(starttime)*60+second(starttime), to = minute(endtime)*60+second(endtime), xunit="time")
  wav_save_path1<-wav_save_path(i,transcript)
  writeWave(audio_nosilence,wav_save_path1)
  return(audio_nosilence)
}

mp3path(18, transcript)
wav_save_path(18, transcript)
for (i in 18:20){
  get_nosilence_slice(i,transcript)
}

#create zone files
zone_list<-unique(transcript$zone)
path_list<-paste("/project/graziul/ra/team_ser/data",zone_list,sep="/")
for (i in 1:length(path_list)){
  dir.create(path_list[i])
}

#create day files
for (i in 1:length(zone_list)){
  transcript1<-subset(transcript,zone==zone_list[i])
  transcript1$day<-format(as.Date(substr(transcript1$file,1,8),'%Y%m%d'),format="%Y_%m_%d")
  day_list<-unique(transcript1$day)
  path_list<-paste("/project/graziul/ra/team_ser/data",zone_list[i],day_list,sep="/")
  for (i in 1:length(path_list)){
    dir.create(path_list[i])
  }
}

#create mp3name files
for (i in 1:length(zone_list)){
  transcript1<-subset(transcript,zone==zone_list[i])
  transcript1$date<-format(as.Date(substr(transcript1$file,1,8),'%Y%m%d'),format="%Y_%m_%d")
  day_list<-unique(transcript1$date)
  path_list<-paste("/project/graziul/ra/team_ser/data",zone_list[i],day_list,sep="/")
  for (i in 1:length(path_list)){
    dir.create(path_list[i])
  }
}

# careful
transcript1<-subset(transcript,zone==zone_list[i])
transcript1$date<-format(as.Date(substr(transcript1$file,1,8),'%Y%m%d'),format="%Y_%m_%d")
day_list<-unique(transcript1$date)
zone_list[i]
for (j in 1:length(day_list)){
  transcript11<-subset(transcript1,date==day_list[j])
  wavefile<-transcript11[,'file']
  mp3name<-substr(wavefile,1,24)
  mp3name<-unique(mp3name)
  path_list<-paste("/project/graziul/ra/team_ser/data/Zone8",day_list[j],mp3name,sep="/")
  for (i in 1:length(path_list)){
    dir.create(path_list[i])
  }
}

