#ifndef RTW_HEADER_continuousProcess_h_
#define RTW_HEADER_continuousProcess_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef continuousProcess_COMMON_INCLUDES_
#define continuousProcess_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "continuousProcess_types.h"
#include "multiword_types.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#define MODEL_NAME continuousProcess
#define NSAMPLE_TIMES (4) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (16) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (5)   
#elif NCSTATES != 5
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T ddrhrmhpq2 ; real_T m250dkhfv0 ; real_T bz3cnq30su ;
real_T o5pisjybo0 ; real_T bga1xo05k4 ; real_T fnzpldm4jx ; real_T i0ow1e2zwy
; real_T njewhruiao ; real_T jwyt1o5zr2 ; real_T lceulpxz11 ; real_T
fiv1dt1tpn ; real_T njkj14u4zx ; real_T gf133lgqhg [ 2 ] ; real_T deq4hxuqj0
; real_T dyw0cfbvtr [ 2 ] ; real_T ptzyrru1as [ 2 ] ; } B ; typedef struct {
real_T hjgdnkrt10 ; real_T kkx1lghlhp ; real_T lamghnkq0l ; real_T e4l0aullb2
; struct { void * LoggedData ; } g0aa02lirf ; struct { void * LoggedData ; }
prdeiyaqbj ; struct { void * LoggedData ; } kbogfx0srx ; int_T olj3vrz2kf ;
int_T koygu0vdjl ; } DW ; typedef struct { real_T frwopi03rt [ 3 ] ; real_T
pb4aweel5w ; real_T d03vwv2liu ; } X ; typedef struct { real_T frwopi03rt [ 3
] ; real_T pb4aweel5w ; real_T d03vwv2liu ; } XDot ; typedef struct {
boolean_T frwopi03rt [ 3 ] ; boolean_T pb4aweel5w ; boolean_T d03vwv2liu ; }
XDis ; typedef struct { real_T frwopi03rt [ 3 ] ; real_T pb4aweel5w ; real_T
d03vwv2liu ; } CStateAbsTol ; typedef struct { real_T frwopi03rt [ 3 ] ;
real_T pb4aweel5w ; real_T d03vwv2liu ; } CXPtMin ; typedef struct { real_T
frwopi03rt [ 3 ] ; real_T pb4aweel5w ; real_T d03vwv2liu ; } CXPtMax ;
typedef struct { real_T m5f1dfp4mq ; real_T lkp30x1rhw ; } ZCV ; typedef
struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
OutputSamplePoints_Value ; real_T Reference_Amplitude ; real_T
Reference_Frequency ; real_T TransferFcn_A [ 3 ] ; real_T TransferFcn_C [ 3 ]
; real_T Loaddisturbance_Time ; real_T Loaddisturbance_Y0 ; real_T
Loaddisturbance_YFinal ; real_T ScaleFactor1_Gain ; real_T ScaleFactor2_Gain
; real_T Integrator1_IC ; real_T Actuatordisturbance_Time ; real_T
Actuatordisturbance_Y0 ; real_T Actuatordisturbance_YFinal ; real_T
Integrator_IC ; } ; extern const char * RT_MEMORY_ALLOCATION_ERROR ; extern B
rtB ; extern X rtX ; extern DW rtDW ; extern P rtP ; extern const
rtwCAPI_ModelMappingStaticInfo * continuousProcess_GetCAPIStaticMap ( void )
; extern SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern
const int_T gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern
rtInportTUtable * gblInportTUtables ; extern const char * gblInportFileName ;
extern const int_T gblNumRootInportBlks ; extern const int_T
gblNumModelInputs ; extern const int_T gblInportDataTypeIdx [ ] ; extern
const int_T gblInportDims [ ] ; extern const int_T gblInportComplex [ ] ;
extern const int_T gblInportInterpoFlag [ ] ; extern const int_T
gblInportContinuous [ ] ; extern const int_T gblParameterTuningTid ; extern
DataMapInfo * rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo *
rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid ) ; void
MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ;
void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
