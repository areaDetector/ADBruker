TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

LIBRARY_IOC += BISDetector
LIB_SRCS    += BISDetector.cpp

PROD_IOC    += BISDetectorApp

#==================================

# <name>.dbd will be created from <name>Include.dbd
DBD += BISDetectorApp.dbd
DBD += BISDetectorSupport.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
PROD_SRCS_DEFAULT += BISDetectorApp_registerRecordDeviceDriver.cpp BISDetectorAppMain.cpp
PROD_SRCS_vxWorks += BISDetectorApp_registerRecordDeviceDriver.cpp BISDetectorAppMain.cpp

# Add locally compiled object code
PROD_LIBS += BISDetector

include $(TOP)/ADApp/commonDriverMakefile

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

