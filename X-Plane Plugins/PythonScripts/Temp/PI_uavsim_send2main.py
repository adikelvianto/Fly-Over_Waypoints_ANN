# File name         : PI_uavsim_send2main.py
# Date              : May 12, 2015
# Created by        : Javen Sembiring
# E-mail            : javen.sembiring@itb.ac.id
# Project           : 
# Description       : Send the flight data to Monitoring System through UDP
# -----------------------------------------------------------------------------

# Import X-Plane SDK Modules
from XPLMDefs import *
from XPLMDisplay import *
from XPLMGraphics import *
from XPLMProcessing import *
from XPLMDataAccess import *

# Import jd Modules
from jdDataRefAddress import *
from jdGetData import *

# Import Python Modules
import socket
import struct

# Define IP Address and Port
# UDP_IP = "192.10.10.1"
UDP_IP = "127.0.0.1"
UDP_PORT_SEND = 20000

class PythonInterface:

    # ## XPluginStart 
    def XPluginStart(self):
        self.Name = "PI_uavsim_send2main.py"
        self.Sig = "Javen.UAVSIM.ITB"
        self.Desc = "A plugin to send data from XP to Network"

        # Load the plugin setup
        fid = open("E:\X-Plane 10\Resources\plugins\PythonScripts\plugin_setup.conf","r")
        self.stxt = fid.readlines()
        fid.close()
        
        self.itxt = []
        for i in range(len(self.stxt)):
            if self.stxt[i][0] in ('#',' ','\n'):
                continue
            self.itxt.append(self.stxt[i])
            
        self.sendTitle = self.itxt[3].split('=')[1]
        self.sendDisplay = int(self.itxt[4].split('=')[1])
        self.sendRate = float(self.itxt[5].split('=')[1])

        # Define FlightLoopCB which refers to FlightLoopCallback()
        self.FlightLoopCB = self.FlightLoopCallback

        # 0.01 indicates the update rate of FlightLoopCB
        XPLMRegisterFlightLoopCallback(self,self.FlightLoopCB, self.sendRate,0)

        # Define functions needed by XPLMCreateWindow()
        self.DrawWindowCB = self.DrawWindowCallback
        self.KeyCB = self.KeyCallback
        self.MouseClickCB = self.MouseClickCallback

        # Call the dataref (datarefAddress)
        datarefAddress(self)

        # Define WindowID which refers to XPLMCreateWindow()
        self.WindowID = XPLMCreateWindow(self, 10, 400, 270, 184, 1,
                                         self.DrawWindowCB, self.KeyCB,
                                         self.MouseClickCB, 0)
        return self.Name, self.Sig, self.Desc

    # ## XPluginStop 
    def XPluginStop(self):
        XPLMUnregisterFlightLoopCallback(self, self.FlightLoopCB, 0)
        XPLMDestroyWindow(self, self.WindowID)
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

    # Functions Creation ......................................................
    # MyDrawingWindowCallback
    def DrawWindowCallback(self, inWindowID, inRefcon):
        
        if self.sendDisplay == 1:
            lLeft, lTop, lRight, lBottom = [], [], [], []
            XPLMGetWindowGeometry(inWindowID, lLeft, lTop, lRight, lBottom)
            left = int(lLeft[0])
            top = int(lTop[0])
            right = int(lRight[0])
            bottom = int(lBottom[0])
    
            XPLMDrawTranslucentDarkBox(left, top, right, bottom)
            color = 1.0, 1.0, 1.0
            color3 = 1.0, 1.0, 0.0
            
            # Call gettingFlightData
            getFlightData(self)
    
            # The text displayed on X-Plane's screen 
            XPLMDrawString(color, left + 5, top - 20,
                            "%s" % (self.sendTitle), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 35,
                            "Plugin used : %s " % (self.Name), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 50,
                            "IP:PORT     : %s :: %s" % (UDP_IP,UDP_PORT_SEND), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 65,
                            "Latitude    : %9.5f [deg]" % (self.xLat), 0,xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 80,
                            "Longitude   : %9.5f [deg]" % (self.xLon), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 95,
                            "Altitude    : %9.4f [m-MSL]" % (self.xAlt), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 110,
                            "Heading     : %9.4f [deg]" % (self.xPsi), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 125,
                            "Pitch       : %9.4f [deg]" % (self.xTheta), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 140,
                            "Roll        : %9.4f [deg]" % (self.xPhi), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 155,
                            "Rudder      : %9.4f [deg]" % (self.xRudDeg), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 170,
                            "Elevator    : %9.4f [deg]" % (self.xElvDeg), 0, xplmFont_Basic)
            XPLMDrawString(color, left + 5, top - 185,
                            "AilL/AilR   : %9.4f / %9.4f [deg]" % (self.xAilLDeg,self.xAilRDeg), 0, xplmFont_Basic)
            XPLMDrawString(color3, left + 5, top - 200,
                            "Send Rate   : %7.1f [/sec]" % (1.0/self.sendRate), 0, xplmFont_Basic)

        pass

    def KeyCallback(self, inWindowID, inkey, inFlags, inVirtualKey,
                    inRefcon, losingFocus):
        pass

    def MouseClickCallback(self, inWindowID, x, y, inMouse, inRefcon):

        return 1

    def FlightLoopCallback(self, elapsedMe, elapsedSim, counter, refcon):
        
        # Call getFlightData function
        getFlightData(self)

        # Assign channel for sending the data
        # c01 = self.xLat
        # c02 = self.xLon
        # c03 = self.xAlt
        # c04 = self.xTAS 
        # c05 = self.xGS
        # c06 = self.xPsi
        # c07 = self.xTheta
        # c08 = self.xPhi
        # c09 = self.xRudDeg
        # c10 = self.xElvDeg
        # c11 = self.xAilLDeg
        # c12 = self.xAilRDeg
        # c13 = self.xThro[0]
        # c14 = self.xThrust[0]
        # c15 = self.xFF[0]
        # c16 = self.xWindSpd
        # c17 = self.xWindDir
        c01 = self.xLat
        c02 = self.xLon
        c03 = self.xAlt
        c04 = self.xPsi
        c05 = self.xTheta
        c06 = self.xPhi
        c07 = self.xTAS
        c08 = self.xJSHead
        c09 = self.xJSPch
        c10 = self.xJSRoll
        c11 = self.xThro[0]
        c12 = self.xThrust[0]
        c13 = self.xFF[0]
        c14 = self.xRudDeg
        c15 = self.xElvDeg
        c16 = self.xAilLDeg
        c17 = self.xAilRDeg
        c18 = self.xGS
        c19 = self.xWindSpd
        c20 = self.xWindDir

        # Pack and send the data
        dataSend = struct.pack('<ffffffffffffffffffff',
                                c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,
                                c11,c12,c13,c14,c15,c16,c17,c18,c19,c20)
        sockSend = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sockSend.sendto(dataSend, (UDP_IP, UDP_PORT_SEND))

        return self.sendRate
