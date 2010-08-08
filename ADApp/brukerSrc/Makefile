TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#USR_CFLAGS += 
#USR_CXXFLAGS += -Wall

# We only build on Linux and Solaris.  If your architecture has
# libtiff, libjpeg, and libz you can add it here.
LIBRARY_IOC_Linux = apex2Detector
LIBRARY_IOC_solaris = apex2Detector
LIBRARY_IOC_cygwin32 = apex2Detector
PROD_IOC_Linux += apex2DetectorApp
PROD_IOC_solaris += apex2DetectorApp
PROD_IOC_cygwin32 += apex2DetectorApp

LIB_SRCS += apex2Detector.cpp
LIB_LIBS += NDPlugin ADBase netCDF
LIB_LIBS_Linux += PvAPI ImageLib
LIB_LIBS_WIN32 += PvAPI ImageLib
LIB_LIBS += calc busy sscan autosave mca
LIB_LIBS += asyn
LIB_LIBS += $(EPICS_BASE_IOC_LIBS)

#==================================

# <name>.dbd will be created from <name>Include.dbd
DBD += apex2DetectorApp.dbd
DBD += apex2DetectorSupport.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
apex2DetectorApp_SRCS_DEFAULT += apex2DetectorApp_registerRecordDeviceDriver.cpp apex2DetectorAppMain.cpp
apex2DetectorApp_SRCS_vxWorks += apex2DetectorApp_registerRecordDeviceDriver.cpp

# Add locally compiled object code
apex2DetectorApp_LIBS += apex2Detector
apex2DetectorApp_LIBS += NDPlugin ADBase netCDF
apex2DetectorApp_LIBS_Linux += PvAPI ImageLib
apex2DetectorApp_LIBS_WIN32 += PvAPI ImageLib
apex2DetectorApp_LIBS += calc busy sscan autosave mca
apex2DetectorApp_LIBS += asyn
apex2DetectorApp_LIBS += $(EPICS_BASE_IOC_LIBS)

apex2DetectorApp_SYS_LIBS_cygwin32 += rpc
apex2DetectorApp_LIBS_cygwin32     += libtiff jpeg libNeXus.dll

# To use versions of these libraries supplied with areaDetector use this line
apex2DetectorApp_LIBS_Linux        += NeXus mfhdf df hdf5 mxml
# To use system versions of these libraries use this line
#apex2DetectorApp_SYS_LIBS_Linux    += NeXus mfhdf df hdf5 mxml

# To use versions of these libraries supplied with areaDetector use this line
apex2DetectorApp_LIBS_Linux        += tiff jpeg z
# To use system versions of these libraries use this line
#apex2DetectorApp_SYS_LIBS_Linux    += tiff jpeg z

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

