TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#USR_CFLAGS += 
#USR_CXXFLAGS += -Wall

# We only build on Linux and Solaris.  If your architecture has
# libtiff, libjpeg, and libz you can add it here.
LIBRARY_IOC_Linux = BISDetector
LIBRARY_IOC_solaris = BISDetector
LIBRARY_IOC_cygwin32 = BISDetector
PROD_IOC_Linux += BISDetectorApp
PROD_IOC_solaris += BISDetectorApp
PROD_IOC_cygwin32 += BISDetectorApp

LIB_SRCS += BISDetector.cpp
LIB_LIBS += NDPlugin ADBase netCDF
LIB_LIBS_Linux += PvAPI ImageLib
LIB_LIBS_WIN32 += PvAPI ImageLib
LIB_LIBS += calc busy sscan autosave mca
LIB_LIBS += asyn
LIB_LIBS += $(EPICS_BASE_IOC_LIBS)

#==================================

# <name>.dbd will be created from <name>Include.dbd
DBD += BISDetectorApp.dbd
DBD += BISDetectorSupport.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
BISDetectorApp_SRCS_DEFAULT += BISDetectorApp_registerRecordDeviceDriver.cpp BISDetectorAppMain.cpp
BISDetectorApp_SRCS_vxWorks += BISDetectorApp_registerRecordDeviceDriver.cpp

# Add locally compiled object code
BISDetectorApp_LIBS += BISDetector
BISDetectorApp_LIBS += NDPlugin ADBase netCDF
BISDetectorApp_LIBS_Linux += PvAPI ImageLib
BISDetectorApp_LIBS_WIN32 += PvAPI ImageLib
BISDetectorApp_LIBS += calc busy sscan autosave mca
BISDetectorApp_LIBS += asyn
BISDetectorApp_LIBS += $(EPICS_BASE_IOC_LIBS)

BISDetectorApp_SYS_LIBS_cygwin32 += rpc
BISDetectorApp_LIBS_cygwin32     += libtiff jpeg libNeXus.dll

# To use versions of these libraries supplied with areaDetector use this line
BISDetectorApp_LIBS_Linux        += NeXus mfhdf df hdf5 mxml
# To use system versions of these libraries use this line
#BISDetectorApp_SYS_LIBS_Linux    += NeXus mfhdf df hdf5 mxml

# To use versions of these libraries supplied with areaDetector use this line
BISDetectorApp_LIBS_Linux        += tiff jpeg z
# To use system versions of these libraries use this line
#BISDetectorApp_SYS_LIBS_Linux    += tiff jpeg z

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

