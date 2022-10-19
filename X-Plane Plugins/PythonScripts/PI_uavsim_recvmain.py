# File name         : PI_uavsim_recvmain.py
# Date              : May 12, 2015
# Created by        : Javen Sembiring
# E-mail            : javen.sembiring@itb.ac.id
# Project           : 
# Description       : Receive data from Main System (Matlab/Simulink)
# -----------------------------------------------------------------------------

# Import X-Plane SDK Modules
from XPLMDefs import *
from XPLMDisplay import *
from XPLMGraphics import *
from XPLMProcessing import *
from XPLMDataAccess import *
from XPLMUtilities import *

# Import jd Modules
from jdDataRefAddress import *
from jdGetData import *
# 

# Import Python Modules
import socket
import struct

# Define IP Address and Port
UDP_IP = "0.0.0.0"
# UDP_IP = "10.128.51.138"
UDP_PORT_RECV = 49001


class PythonInterface:

    # ## XPluginStart
    def XPluginStart(self):
        # All the initialization variables and functions are defined here
        self.Name = "PI_uavsim_recvmain.py"
        self.Sig  = "Javen.UAVSIM.ITB"
        self.Desc = "A plugin to recive data from Matlab/Simulink via UDP"

        # Load the plugin setup
        fid = open("D:\Games\X-Plane 11\Resources\plugins\PythonScripts\plugin_setup.conf","r")
        self.stxt = fid.readlines()
        fid.close()
        
        self.itxt = []
        for i in range(len(self.stxt)):
            if self.stxt[i][0] in ('#',' ','\n'):
                continue
            self.itxt.append(self.stxt[i])
            
        self.recvTitle   = self.itxt[0].split('=')[1]
        self.recvDisplay = int(self.itxt[1].split('=')[1])
        self.recvRate    = float(self.itxt[2].split('=')[1])
        
        self.FlightLoopCB = self.FlightLoopCallback

        # 0.01 indicates that the function is called every 0.01 second
        XPLMRegisterFlightLoopCallback(self,self.FlightLoopCB,self.recvRate,0)
        
        # Define a socket to receive data
        self.sockRecv  = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

        # Bind the sockRecv
        self.sockRecv.bind((UDP_IP, UDP_PORT_RECV))

        # These functions are for XPLMCreateWindow (needs three parameters)
        self.DrawWindowCB = self.DrawWindowCallback
        self.KeyCB        = self.KeyCallback
        self.MouseClickCB = self.MouseClickCallback

        # Define initial variable name and value
        self.inPause   = 0.0
        self.inView    = 0.0
        self.inWindSpd = 0.0
        self.inWindDir = 0.0
                
        
        # Call datarefAddress(). This function contains all the dataref
        # needed in the simulation -- called from jdDataRefAddress.py
        datarefAddress(self)

        # Create a XPLMCreateWindow which also calls three parameters defined above
        self.WindowID  = XPLMCreateWindow(self, 10, 180, 270, 10, 1,
                                          self.DrawWindowCB, self.KeyCB,
                                          self.MouseClickCB, 0)

        return self.Name, self.Sig, self.Desc

    # ## XPluginStop 
    def XPluginStop(self):
        XPLMUnregisterFlightLoopCallback(self, self.FlightLoopCB, 0)
        XPLMDestroyWindow(self, self.WindowID)
        self.sockRecv.close()
        pass

    # ## XPluginEnable 
    def XPluginEnable(self):
        return 1

    # ## XPluginDisable 
    def XPluginDisable(self):
        pass

    # ## XPluginReceiveMessage 
    def XPluginReceiveMessage(self, inFromWho, inMessage, inParam):
        pass


    # .........................................................................
    # Below are functions to be called in the main X-Plane's functions 
    #   FlightLoopCallback()
    #   DrawWindowCallback() 
    #   KeyCallback()
    #   MouseClickCallback()
    # The last three functions are required by XPLMCreateWindow()
    # .........................................................................

    # FlightLoopCallback 
    def FlightLoopCallback(self, elapsedMe, elapsedSim, counter, refcon):
        
        # *** Get current state of dataref
        getFlightData(self)
        
        # *** Set the altitude where wind speed and direction applied
        XPLMSetDataf(self.gWindAlt,10000)

    
        # Define a socket to receive data
        self.sockRecv  = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

        # Bind the sockRecv
        self.sockRecv.bind((UDP_IP, UDP_PORT_RECV))

        # If socket is not set to non-blocking mode, the X-Plane is freezing
        # if there is no data received
        # non blocking = 0 , blocking = 1 (default)
        #self.sockRecv.setblocking(0)
        # I prefer to use settimeout(time), since this function more reliable
        # than that of setblocking(0)
        self.sockRecv.settimeout(0.01)
        
        try:
            # Receive Data
            # There are 4 data, each 4 bytes -- float type.
            dataRecv= self.sockRecv.recv(16)
            
            # Unpack Data
            (self.inPause,
             self.inView,
             self.inWindSpd,
             self.inWindDir) = struct.unpack('<ffff', dataRecv[0:16])

            # *** Pause or unpaused the X-Plane
            if self.xPause == 0:
                if int(self.inPause) == 1:
                    XPLMCommandKeyStroke(xplm_key_pause)
                else:
                    pass
            elif self.xPause == 1:
                if int(self.inPause) == 2:
                    XPLMCommandKeyStroke(xplm_key_pause)
            else:
                pass
                

            # *** Set the view
            if int(self.inView) == 1:
                XPLMCommandKeyStroke(xplm_key_chase)
            if int(self.inView) == 2:
                XPLMCommandKeyStroke(xplm_key_free1)
            if int(self.inView) == 3:
                XPLMCommandKeyStroke(xplm_key_spot)
            if int(self.inView) == 4:
                XPLMCommandKeyStroke(xplm_key_left)
                
            # *** Set Wind Speed and Wind Direction
            XPLMSetDataf(self.gWindSpd,self.inWindSpd)
            XPLMSetDataf(self.gWindDir,self.inWindDir)
                        

        except:
            pass

        # Return 0.02 means that the function is called again every 0.02 sec
        return self.recvRate

    # MyDrawingWindowCallback
    def DrawWindowCallback(self, inWindowID, inRefcon):

        if int(self.recvDisplay) == 1:
            lLeft   = []
            lTop    = []
            lRight  = []
            lBottom = []
            
            XPLMGetWindowGeometry(inWindowID, lLeft, lTop, lRight, lBottom)
            left    = int(lLeft[0])
            top     = int(lTop[0])
            right   = int(lRight[0])
            bottom  = int(lBottom[0])

            XPLMDrawTranslucentDarkBox(left, top, right, bottom)
            color = 1.0, 1.0, 1.0
            color2= 1.0, 0.0, 0.0
            color3= 1.0, 1.0, 0.0

            # Call getFlightData() -- called from jsGetData.py
            getFlightData(self)

            # The text displayed on X-Plane's screen
            XPLMDrawString(color, left + 5, top - 20,
                            "%s" % (self.recvTitle), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 35,
                            "Plugin used : %s " % (self.Name), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 50,
                            "IP:PORT     : %s :: %s" % (UDP_IP,UDP_PORT_RECV), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 65,
                            "inPause     : %7.0f [-]" % (self.inPause), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 80,
                            "xPause      : %7.0f [-]" % (self.xPause), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 95,
                            "inView      : %7.2f [-]" % (self.inView), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 110,
                            "inWindSpd   : %7.2f [kts]" % (self.inWindSpd), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 125,
                            "inWindDir   : %7.2f [deg]" % (self.inWindDir), 0, xplmFont_Basic)
            XPLMDrawString(color3, left + 5, top - 140,
                            "Recv. Rate  : %7.1f [/sec]" % (1.0/self.recvRate), 0, xplmFont_Basic)


        pass
    
    # KeyCallback
    def KeyCallback(self, inWindowID, inkey, inFlags, inVirtualKey, inRefcon, losingFocus):
        pass
    
    # MouseClickCallback
    def MouseClickCallback(self, inWindowID, x, y, inMouse, inRefcon):
        return 1
