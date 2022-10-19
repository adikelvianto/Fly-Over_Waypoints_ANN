# File name         : jdDataRefAddress.py
# Date              : May 12, 2015
# Created by        : Javen Sembiring
# E-mail            : javen.sembiring@itb.ac.id
# Project           : 
# Description       : - This script serves as X-Plane parameter address.
#                     - For details, see DataRefs.txt file in X-Plane 
#                       installation folder.
# -----------------------------------------------------------------------------

# Import X-PLANE's SDK Modules
from XPLMDataAccess import *

def datarefAddress(self):

    # -------------------------------------------------------------------------
    # ***** TIME DATAREF *****
    # -------------------------------------------------------------------------
    # [1] gIsTime    : int    y  boolean  Is the timer running?
    # [2] gElapTime  : float  y  seconds  Total time elapsed on the timer, 
    #                                     will run if gIsTime is set to 1
    # [3] gTotalTime : float  y  seconds  Total time since the flight got reset 
    #                                     by something.
    # -------------------------------------------------------------------------
    self.gIsTime    = XPLMFindDataRef('sim/time/timer_is_running_sec')
    self.gElapTime  = XPLMFindDataRef('sim/time/timer_elapsed_time_sec')
    self.gTotalTime = XPLMFindDataRef('sim/time/total_flight_time_sec')

    # -------------------------------------------------------------------------
    # ***** ACCELERATION IN LOCAL COORDINATE DATAREF *****
    # -------------------------------------------------------------------------
    # [4] gAx     : float  y  g  g load in x body axis
    # [5] gAy     : float  y  g  g load in y body axis
    # [6] gAz     : float  y  g  g load in z body axis
    # -------------------------------------------------------------------------
    self.gAx    = XPLMFindDataRef('sim/flightmodel2/misc/gforce_axil')
    self.gAy    = XPLMFindDataRef('sim/flightmodel2/misc/gforce_side')
    self.gAz    = XPLMFindDataRef('sim/flightmodel2/misc/gforce_normal')

    # -------------------------------------------------------------------------
    # ***** EULER ANGLES AND TRACK + DRIFT ANGLES DATAREF *****
    # -------------------------------------------------------------------------
    # [7]  gPhi    : float  y  deg   roll of the aircraft in degrees
    # [8]  gTheta  : float  y  deg   pitch relative to the plane normal to the Y axis
    # [9]  gPsi    : float  y  deg   true heading of the aircraft from the Z axis
    # -------------------------------------------------------------------------
    self.gPhi   = XPLMFindDataRef('sim/flightmodel/position/phi')
    self.gTheta = XPLMFindDataRef('sim/flightmodel/position/theta')
    self.gPsi   = XPLMFindDataRef('sim/flightmodel/position/psi')
    
    # -------------------------------------------------------------------------
    # ***** BODY RATE DATAREF *****
    # -------------------------------------------------------------------------
    # [12] gP      : float y deg/sec The roll rotation rates
    # [13] gQ      : float y deg/sec The pitch rotation rates
    # [14] gR      : float y deg/sec The yaw rotation rates
    # -------------------------------------------------------------------------
    self.gP     = XPLMFindDataRef('sim/flightmodel/position/P') 
    self.gQ     = XPLMFindDataRef('sim/flightmodel/position/Q') 
    self.gR     = XPLMFindDataRef('sim/flightmodel/position/R') 

    # -------------------------------------------------------------------------
    # ***** BODY ACCELERATION DATAREF *****
    # -------------------------------------------------------------------------
    # [15] gPdot   : float n deg/sec2 The roll angular acceleration
    # [16] gQdot   : float n deg/sec2 The pitch angular acceleration
    # [17] gRdot   : float n deg/sec2 The yaw angular acceleration
    # -------------------------------------------------------------------------
    self.gPdot  = XPLMFindDataRef('sim/flightmodel/position/P_dot')
    self.gQdot  = XPLMFindDataRef('sim/flightmodel/position/Q_dot')
    self.gRdot  = XPLMFindDataRef('sim/flightmodel/position/R_dot')

    # -------------------------------------------------------------------------
    # ***** AIRSPEED AND FLOW ANGLE DATAREF *****
    # -------------------------------------------------------------------------
    # [18] gGS     : float n  m/s    Aircraft ground speed
    # [19] gIAS    : float y  kias   Air speed indicated 
    # [20] gTAS    : float n  m/s    True airspeed
    # [21] gVh     : float n  m/s    Vertical velocity in meters per second
    # [22] gAOA    : float n  deg    Angle of attack
    # [23] gAOS    : float n  deg    Side slip angle
    # -------------------------------------------------------------------------
    self.gGS    = XPLMFindDataRef('sim/flightmodel/position/groundspeed')
    self.gIAS   = XPLMFindDataRef('sim/flightmodel/position/indicated_airspeed')
    self.gTAS   = XPLMFindDataRef('sim/flightmodel/position/true_airspeed')
    self.gVh    = XPLMFindDataRef('sim/flightmodel/position/vh_ind')
    self.gAOA   = XPLMFindDataRef('sim/flightmodel/position/alpha')
    self.gAOS   = XPLMFindDataRef('sim/flightmodel/position/beta')

    # -------------------------------------------------------------------------
    # ***** GEODETIC POSITION DATAREF *****
    # -------------------------------------------------------------------------
    # [24] gLat    : double n   deg The latitude of the aircraft
    # [25] gLon    : double n   deg The longitude of the aircraft
    # [26] gAlt    : double n   m   The elevation above MSL of the aircraft
    # [27] gHAgl   : float  n   m   AGL
    # -------------------------------------------------------------------------
    self.gLat   = XPLMFindDataRef('sim/flightmodel/position/latitude')
    self.gLon   = XPLMFindDataRef('sim/flightmodel/position/longitude')
    self.gAlt   = XPLMFindDataRef('sim/flightmodel/position/elevation')
    self.gHAgl  = XPLMFindDataRef('sim/flightmodel/position/y_agl')

    # -------------------------------------------------------------------------
    # ***** FLIGHT CONDITION *****
    # -------------------------------------------------------------------------
    # [28] gPressAlt: float n  29.92 +- .. Barometric pressure at current altitude
    # [29] gPressSL : float y  29.92 +- .. Barometric pressure at sea level
    # [30] gDensRat : float n  ???         Atmospheric density as a ratio compared to sea level
    # [31] gDensSL  : float n  kg/m3       Density of the air at sea level
    # [32] gSSoundSL: float n  m/sec       Speed of sound  at the plane's location.
    # [33] gTempAlt : float n  degC        Air temperature outside the aircraft at current altitude
    # [34] gTempSL  : float y  degC        Temperature at sea level.
    # [35] gWinSpd  : float n  kts >= 0    Effective speed of the wind at the plane's location
    # [36] gWinDir  : float n  [0-359)     Effective direction of the wind at the plane's location
    # -------------------------------------------------------------------------
    self.gPressAlt= XPLMFindDataRef('sim/weather/barometer_current_inhg')
    self.gPressSL = XPLMFindDataRef('sim/weather/barometer_sealevel_inhg')
    self.gDensRat = XPLMFindDataRef('sim/weather/sigma')
    self.gDensSL  = XPLMFindDataRef('sim/weather/rho')
    self.gSSoundSL= XPLMFindDataRef('sim/weather/speed_sound_ms')
    self.gTempAlt = XPLMFindDataRef('sim/weather/temperature_ambient_c')
    self.gTempSL  = XPLMFindDataRef('sim/weather/temperature_sealevel_c')
    self.gWindSpd = XPLMFindDataRef('sim/weather/wind_speed_kt[0]')
    self.gWindDir = XPLMFindDataRef('sim/weather/wind_direction_degt[0]')
    self.gWindAlt = XPLMFindDataRef('sim/weather/wind_altitude_msl_m[0]')

    # -------------------------------------------------------------------------
    # ***** CONTROL SURFACES DATAREF *****
    # -------------------------------------------------------------------------
    # [37] gJSRoll : float y  [-1..1] The def. of the js axis controlling yaw
    # [38] gJSPch  : float y  [-1..1] The def. of the js axis controlling pitch
    # [39] gJSYaw  : float y  [-1..1] The def. of the js axis controlling yaw
    # [40] gAilLDeg: float y  deg     Deflection left aileron
    # [41] gAilRDeg: float y  deg     Deflection right aileron
    # [42] gElvDeg : float y  deg     Deflection Wing 1 Elevator 1
    # [43] gRudDeg : float y  deg     Deflection Left Aileron 1
    # -------------------------------------------------------------------------
    self.gJSRoll  = XPLMFindDataRef('sim/joystick/yoke_roll_ratio')
    self.gJSPch   = XPLMFindDataRef('sim/joystick/yoke_pitch_ratio')
    self.gJSHead  = XPLMFindDataRef('sim/joystick/yoke_heading_ratio')
    self.gAilLDeg = XPLMFindDataRef('sim/flightmodel/controls/wing1l_ail1def')
    self.gAilRDeg = XPLMFindDataRef('sim/flightmodel/controls/wing1r_ail1def')
    self.gElvDeg  = XPLMFindDataRef('sim/flightmodel/controls/hstab1_elv1def')
    self.gRudDeg  = XPLMFindDataRef('sim/flightmodel/controls/ldruddef')

    # -------------------------------------------------------------------------
    # ***** ENGINE AND FUEL FLOW DATAREF *****
    # -------------------------------------------------------------------------
    # gPower    : float[8] y Nm/s    Power  (per engine)
    # gThrust   : float[8] n N       Thrust (per engine)
    # gEngN1    : float[8] y percent N1 speed as percent of max (per engine)
    # gThro     : float[8] y ratio   Throttle (per engine) as set by user [0 - 1]
    # gFF       : float[8] y kg/s    Fuel flow (per engine)
    # -------------------------------------------------------------------------
    self.gPower  = XPLMFindDataRef('sim/flightmodel/engine/ENGN_power')
    self.gThrust = XPLMFindDataRef('sim/cockpit2/engine/indicators/thrust_n')
    self.gEngN1  = XPLMFindDataRef('sim/flightmodel/engine/ENGN_N1_')
    self.gThro   = XPLMFindDataRef('sim/flightmodel/engine/ENGN_thro')
    self.gFF     = XPLMFindDataRef('sim/flightmodel/engine/ENGN_FF_')
    
    # -------------------------------------------------------------------------
    # ***** UTILITIES DATAREF *****
    # -------------------------------------------------------------------------
    # gPause  : inte n [0 or 1]  is the sim paused? Use cmd keys to change this.
    self.gPause = XPLMFindDataRef('sim/time/paused')