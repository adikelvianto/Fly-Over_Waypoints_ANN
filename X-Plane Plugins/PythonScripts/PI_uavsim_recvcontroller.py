# File name         : PI_uavsim_A_RecvFromCtrl.py
# Date              : May 12, 2015
# Created by        : Javen Sembiring
# E-mail            : javen.sembiring@itb.ac.id
# Project           : LAPAN UAV Simulator
# Description       : Receive data from Controller System (Matlab/Simulink)
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


# Import Python Modules
import socket
import struct

# Define IP Address and Port
# UDP_IP = "192.10.0.1"
UDP_IP = "0.0.0.0"
UDP_PORT_RECV = 49000


class PythonInterface:

    # ## XPluginStart 
    def XPluginStart(self):
        # All the initialization variables and functions are defined here
        self.Name = "PI_uavsim_A_RecvFromCtrl.py"
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
            
        self.recvTitle   = self.itxt[6].split('=')[1]
        self.recvDisplay = int(self.itxt[7].split('=')[1])
        self.recvRate    = float(self.itxt[8].split('=')[1])
        
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
        self.inYH_Sta = 0.0
        self.inYH_Ail = 0.0
        
        self.inPH_Sta = 0.0
        self.inPH_Elv = 0.0
        
        self.inRH_Sta = 0.0
        self.inRH_Ail = 0.0
        
        # Call datarefAddress(). This function contains all the dataref
        # needed in the simulation -- called from jdDataRefAddress.py
        datarefAddress(self)

        # Create a XPLMCreateWindow which also calls three parameters defined above
        self.WindowID  = XPLMCreateWindow(self, 10, 570, 270, 405, 1,
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
        self.sockRecv.settimeout(0.001)
        
        try:
            # Receive Data
            # There are 6 data, each 4 bytes -- float type.
            dataRecv= self.sockRecv.recv(24)
            
            # Unpack Data
            (self.inYH_Ail,
             self.inYH_Sta,
             self.inRH_Ail,
             self.inRH_Sta,
             self.inPH_Elv,
             self.inPH_Sta) = struct.unpack('<ffffff', dataRecv[0:24])
            
            # *** Set controller for yaw hold
            if int(self.inYH_Sta) != 0:
                XPLMSetDataf(self.gJSRoll, self.inYH_Ail)
                            
            # *** Set controller for roll hold
            if int(self.inRH_Sta) != 0:
                XPLMSetDataf(self.gJSRoll, self.inRH_Ail)
                
            # *** Set controller for pitch hold
            if int(self.inPH_Sta) != 0:
                XPLMSetDataf(self.gJSPch,self.inPH_Elv)
                
        except:
            pass

        # Return 0.02 means that the function is called again every 0.02 sec
        return self.recvRate

    # MyDrawingWindowCallback
    def DrawWindowCallback(self, inWindowID, inRefcon):

        if int(self.recvDisplay) == 1:
            lLeft, lTop, lRight, lBottom = [], [], [], []            
            XPLMGetWindowGeometry(inWindowID, lLeft, lTop, lRight, lBottom)
            left = int(lLeft[0])
            top = int(lTop[0])
            right = int(lRight[0])
            bottom = int(lBottom[0])

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
                            "inYH_Sta    : %7.0f [-]" % (self.inYH_Sta), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 80,
                            "inYH_Ail/Cur: %7.4f/%7.4f [rat]" % (self.inYH_Ail, self.xJSRoll), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 95,
                            "inPH_Sta    : %7.0f [-]" % (self.inPH_Sta), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 110,
                            "inPH_Elv/Cur: %7.4f/%7.4f [rat]" % (self.inPH_Elv, self.xJSPch), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 125,
                            "inRH_Sta    : %7.0f [-]" % (self.inRH_Sta), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 140,
                            "inRH_Ail/Cur: %7.4f/%7.4f [rat]" % (self.inRH_Ail, self.xJSRoll), 0, xplmFont_Basic)
            XPLMDrawString(color3, left + 5, top - 155,
                            "Recv. Rate  : %7.1f [/sec]" % (1.0/self.recvRate), 0, xplmFont_Basic)
        pass
    
    # KeyCallback
    def KeyCallback(self, inWindowID, inkey, inFlags, inVirtualKey, inRefcon, losingFocus):
        pass
    
    # MouseClickCallback
    def MouseClickCallback(self, inWindowID, x, y, inMouse, inRefcon):
        return 1
