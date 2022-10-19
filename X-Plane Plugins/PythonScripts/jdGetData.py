# File name         : jdGeData.py
# Date              : 20.05.2015
# Created by        : Javen Sembiring
# E-mail            : javen.sembiring@itb.ac.id
# Project           : 
# Description       : This script retrieves the flight data defined in the 
#                     jdDatarefAddress module
# -----------------------------------------------------------------------------


# Import X-PLANE's SDK Modules ................................................
from XPLMDataAccess import *

# Import jd' Modules
from jdDataRefAddress import *

def getFlightData(self):

    # -------------------------------------------------------------------------
    # ***** TIME DATA *****
    # -------------------------------------------------------------------------
    # gIsTime  : int    y  boolean  Is the timer running?
    # gElapTime: float  y  seconds  Total time elapsed on the timer
    # -------------------------------------------------------------------------
    self.xIsTime   = XPLMGetDatai(self.gIsTime)
    self.xElapTime = XPLMGetDataf(self.gElapTime)
    self.xTotalTime= XPLMGetDataf(self.gTotalTime)

    # -------------------------------------------------------------------------
    # ***** ACCELERATION IN LOCAL COORDINATE DATAREF *****
    # -------------------------------------------------------------------------
    # gAx     : float  y  m/s2  The acceleration in local OGL coordinates
    # gAy     : float  y  m/s2  The acceleration in local OGL coordinates
    # gAz     : float  y  m/s2  The acceleration in local OGL coordinates
    # -------------------------------------------------------------------------
    self.xAx    = XPLMGetDataf(self.gAx)
    self.xAy    = XPLMGetDataf(self.gAy)
    self.xAz    = XPLMGetDataf(self.gAz)

    # -------------------------------------------------------------------------
    # ***** EULER ANGLES AND TRACK + DRIFT ANGLES DATAREF *****
    # -------------------------------------------------------------------------
    # gPhi    : float  y  deg   The roll of the aircraft in degrees
    # gTheta  : float  y  deg   The pitch relative to the plane normal to the Y axis
    # gPsi    : float  y  deg   The true heading of the aircraft from the Z axis
    # -------------------------------------------------------------------------
    self.xPhi   = XPLMGetDataf(self.gPhi)
    self.xTheta = XPLMGetDataf(self.gTheta)
    self.xPsi   = XPLMGetDataf(self.gPsi)

    # -------------------------------------------------------------------------
    # ***** EULER ANGLES RATE DATAREF *****
    # -------------------------------------------------------------------------
    # gP      : float y deg/sec The roll rotation rates (relative to the flight)
    # gQ      : float y deg/sec The pitch rotation rates (relative to the flight)
    # gR      : float y deg/sec The yaw rotation rates (relative to the flight)
    # -------------------------------------------------------------------------
    self.xP     = XPLMGetDataf(self.gP)
    self.xQ     = XPLMGetDataf(self.gQ)
    self.xR     = XPLMGetDataf(self.gR)

    # -------------------------------------------------------------------------
    # ***** EULER ANGLES ACCELERATION DATAREF *****
    # -------------------------------------------------------------------------
    # gPdot   : float n deg/sec2 The roll angular acceleration
    # gQdot   : float n deg/sec2 The pitch angular acceleration
    # gRdot   : float n deg/sec2 The yaw angular acceleration
    # -------------------------------------------------------------------------
    self.xPdot  = XPLMGetDataf(self.gPdot)
    self.xQdot  = XPLMGetDataf(self.gQdot)
    self.xRdot  = XPLMGetDataf(self.gRdot)

    # -------------------------------------------------------------------------
    # ***** AIRSPEED AND FLOW ANGLE DATAREF *****
    # -------------------------------------------------------------------------
    # gGS     : float n  m/s    Aircraft ground speed
    # gIAS    : float y  kias   Air speed indicated (takes into account air density and wind)
    # gTAS    : float n  m/s    True airspeed (does not take into account air density at altitude)
    # gVh     : float n  m/s    Vertical velocity in meters per second
    # gAOA    : float n  deg    Angle of attack
    # gAOS    : float n  deg    Side slip angle
    # -------------------------------------------------------------------------
    self.xGS    = XPLMGetDataf(self.gGS)
    self.xIAS   = XPLMGetDataf(self.gIAS)
    self.xTAS   = XPLMGetDataf(self.gTAS)
    self.xVh    = XPLMGetDataf(self.gVh)
    self.xAOA   = XPLMGetDataf(self.gAOA)
    self.xAOS   = XPLMGetDataf(self.gAOS)

    # -------------------------------------------------------------------------
    # ***** GEODETIC POSITION DATAREF *****
    # -------------------------------------------------------------------------
    # gLat    : double n   deg The latitude of the aircraft
    # gLon    : double n   deg The longitude of the aircraft
    # gAlt    : double n   m   The elevation above MSL of the aircraft
    # gHAgl   : float  n   m   AGL
    # -------------------------------------------------------------------------
    self.xLat   = XPLMGetDatad(self.gLat)
    self.xLon   = XPLMGetDatad(self.gLon)
    self.xAlt   = XPLMGetDatad(self.gAlt)
    self.xHAgl  = XPLMGetDataf(self.gHAgl)

    # -------------------------------------------------------------------------
    # ***** FLIGHT CONDITION *****
    # -------------------------------------------------------------------------
    # gPressAlt: float n  29.92 +- .. Barometric pressure at current altitude
    # gPressSL : float y  29.92 +- .. Barometric pressure at sea level
    # gDensRat : float n  ???         Atmospheric density as a ratio compared to sea level
    # gDensSL  : float n  kg/m3       Density of the air at sea level
    # gSSoundSL: float n  m/sec       Speed of sound  at the plane's location.
    # gTempAlt : float n  degC        Air temperature outside the aircraft at current altitude
    # gTempSL  : float y  degC        Temperature at sea level.
    # gWinSpd  : float n  kts >= 0    Effective speed of the wind at the plane's location
    # gWinDir  : float n  [0-359)     Effective direction of the wind at the plane's location
    # -------------------------------------------------------------------------
    self.xPressAlt = XPLMGetDataf(self.gPressAlt)
    self.xPressSL  = XPLMGetDataf(self.gPressSL)
    self.xDensRat  = XPLMGetDataf(self.gDensRat)
    self.xDensSL   = XPLMGetDataf(self.gDensSL)
    self.xSSoundSL = XPLMGetDataf(self.gSSoundSL)
    self.xTempAlt  = XPLMGetDataf(self.gTempAlt)
    self.xTempSL   = XPLMGetDataf(self.gTempSL)
    self.xWindSpd  = XPLMGetDataf(self.gWindSpd)
    self.xWindDir  = XPLMGetDataf(self.gWindDir)

    # -------------------------------------------------------------------------
    # ***** CONTROL SURFACES DATAREF *****
    # -------------------------------------------------------------------------
    # gJSRoll : float y  [-1..1] The def. of the js axis controlling yaw
    # gJSPch  : float y  [-1..1] The def. of the js axis controlling pitch
    # gJSYaw  : float y  [-1..1] The def. of the js axis controlling yaw
    # gAilLDeg: float y  deg     Deflection left aileron
    # gAilRDeg: float y  deg     Deflection right aileron
    # gElvDeg : float y  deg     Deflection Wing 1 Elevator 1
    # gRudDeg : float y  deg     Deflection Left Aileron 1
    # -------------------------------------------------------------------------
    self.xJSRoll   = XPLMGetDataf(self.gJSRoll)
    self.xJSPch    = XPLMGetDataf(self.gJSPch)
    self.xJSHead   = XPLMGetDataf(self.gJSHead)
    self.xAilLDeg  = XPLMGetDataf(self.gAilLDeg)
    self.xAilRDeg  = XPLMGetDataf(self.gAilRDeg)
    self.xElvDeg   = XPLMGetDataf(self.gElvDeg)
    self.xRudDeg   = XPLMGetDataf(self.gRudDeg)
    
    # -------------------------------------------------------------------------
    # ***** ENGINE AND FUEL FLOW DATAREF *****
    # -------------------------------------------------------------------------
    # gThrust   : float[8] y ???     Power (per engine)
    # gEngN1    : float[8] y percent N1 speed as percent of max (per engine)
    # gThro     : float[8] y ratio   Throttle (per engine) as set by user [0 - 1]
    # gFF       : float[8] y kg/s    Fuel flow (per engine)
	# gThrust   : float[8] n N       Thrust (per engine)
    # -------------------------------------------------------------------------
    self.xThrust  = []
    self.xPower   = []
    self.xEngN1   = []
    self.xThro    = []
    self.xFF      = []
    XPLMGetDatavf(self.gThrust,self.xThrust,0,8)
    XPLMGetDatavf(self.gPower,self.xPower,0,8)
    XPLMGetDatavf(self.gEngN1,self.xEngN1,0,8)
    XPLMGetDatavf(self.gThro,self.xThro,0,8)
    XPLMGetDatavf(self.gFF,self.xFF,0,8)
    
    # -------------------------------------------------------------------------
    # ***** UTILITIES DATAREF *****
    # -------------------------------------------------------------------------
    # gPause  : inte n [0 or 1]  is the sim paused? Use cmd keys to change this.
    # -------------------------------------------------------------------------
    self.xPause = XPLMGetDatai(self.gPause)
