< envPaths
errlogInit(20000)

dbLoadDatabase("$(AREA_DETECTOR)/dbd/apex2DetectorApp.dbd")
apex2DetectorApp_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("PREFIX", "APEX2:")
epicsEnvSet("PORT",   "APX")
epicsEnvSet("COMMAND_PORT", "BIS_COMMAND")
epicsEnvSet("FILE_PORT",    "BIS_FILE")
epicsEnvSet("STATUS_PORT",  "BIS_STATUS")
epicsEnvSet("QSIZE",  "20")
epicsEnvSet("XSIZE",  "512")
epicsEnvSet("YSIZE",  "512")
epicsEnvSet("NCHANS", "2048")

###
# Create the asyn port to talk to the APEX2 on command port 49153.
drvAsynIPPortConfigure($(COMMAND_PORT),"chemmat21:49153")
asynSetTraceIOMask($(COMMAND_PORT),0,2)
#asynSetTraceMask($(COMMAND_PORT),0,255)

drvAsynIPPortConfigure($(FILE_PORT),"chemmat21:49154")
asynSetTraceIOMask($(FILE_PORT),0,2)
#asynSetTraceMask($(FILE_PORT),0,255)

drvAsynIPPortConfigure($(STATUS_PORT),"chemmat21:49155")
asynSetTraceIOMask($(STATUS_PORT),0,2)
asynSetTraceIOTruncateSize($(STATUS_PORT),0,512)
#asynSetTraceMask($(STATUS_PORT),0,255)

# Set the terminators
asynOctetSetOutputEos($(COMMAND_PORT), 0, "\n")
# Note: The BIS documentation says that the responses on the COMMAND port are terminated with \n, but they are not in our BIS version.
# The do all end with ], so use that.
asynOctetSetInputEos($(COMMAND_PORT), 0, "]")
asynOctetSetInputEos($(STATUS_PORT), 0, "\n")

apex2DetectorConfig($(PORT), $(COMMAND_PORT), $(STATUS_PORT), 50, 200000000)
dbLoadRecords("$(AREA_DETECTOR)/ADApp/Db/ADBase.template", "P=APEX2:,R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(AREA_DETECTOR)/ADApp/Db/NDFile.template", "P=APEX2:,R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(AREA_DETECTOR)/ADApp/Db/apex2.template","P=APEX2:,R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1,COMMAND_PORT=BIS1")
asynSetTraceIOMask($(PORT),0,2)
#asynSetTraceMask($(PORT),0,255)


# Create a standard arrays plugin
NDStdArraysConfigure("apxImage", 5, 0, $(PORT), 0, -1)
dbLoadRecords("$(AREA_DETECTOR)/ADApp/Db/NDPluginBase.template","P=APEX2:,R=image1:,PORT=apxImage,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT),NDARRAY_ADDR=0")
# This creates a waveform large enough to hold a 4096x4096 image
dbLoadRecords("$(AREA_DETECTOR)/ADApp/Db/NDStdArrays.template", "P=APEX2:,R=image1:,PORT=apxImage,ADDR=0,TIMEOUT=1,TYPE=Int32,FTVL=LONG,NELEMENTS=16777216")

< ../commonPlugins.cmd

asynSetTraceIOMask($(PORT),0,2)
#asynSetTraceMask($(PORT),0,255)

iocInit()

# save things every thirty seconds
create_monitor_set("auto_settings.req", 30,"P=APEX2:,D=cam1:")
