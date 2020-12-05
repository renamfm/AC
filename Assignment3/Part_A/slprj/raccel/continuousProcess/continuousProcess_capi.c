#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "continuousProcess_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "continuousProcess.h"
#include "continuousProcess_capi.h"
#include "continuousProcess_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"continuousProcess/Derivative " ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 1 , 0 , TARGET_STRING ( "continuousProcess/ScaleFactor1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 2 , 0 , TARGET_STRING (
"continuousProcess/ScaleFactor2" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 3 , 0 , TARGET_STRING ( "continuousProcess/Integrator" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 4 , 0 , TARGET_STRING (
"continuousProcess/Integrator1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 5 , 0 , TARGET_STRING ( "continuousProcess/Product" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 6 , 0 , TARGET_STRING (
"continuousProcess/Reference" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 }
, { 7 , 0 , TARGET_STRING ( "continuousProcess/Actuator disturbance" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 1 } , { 8 , 0 , TARGET_STRING (
"continuousProcess/Load disturbance" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0
, 1 } , { 9 , 0 , TARGET_STRING ( "continuousProcess/Sum" ) , TARGET_STRING (
"" ) , 0 , 0 , 0 , 0 , 0 } , { 10 , 0 , TARGET_STRING (
"continuousProcess/Sum1" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , {
11 , 0 , TARGET_STRING ( "continuousProcess/Sum2" ) , TARGET_STRING ( "" ) ,
0 , 0 , 0 , 0 , 0 } , { 12 , 0 , TARGET_STRING (
"continuousProcess/Transfer Fcn" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 13 , 0 , TARGET_STRING (
"continuousProcess/Fuzzy Logic  Controller  with Ruleviewer/Zero-Order Hold"
) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 2 } , { 0 , 0 , ( NULL ) , ( NULL
) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_BlockParameters
rtBlockParameters [ ] = { { 14 , TARGET_STRING (
"continuousProcess/ScaleFactor1" ) , TARGET_STRING ( "Gain" ) , 0 , 0 , 0 } ,
{ 15 , TARGET_STRING ( "continuousProcess/ScaleFactor2" ) , TARGET_STRING (
"Gain" ) , 0 , 0 , 0 } , { 16 , TARGET_STRING (
"continuousProcess/Integrator" ) , TARGET_STRING ( "InitialCondition" ) , 0 ,
0 , 0 } , { 17 , TARGET_STRING ( "continuousProcess/Integrator1" ) ,
TARGET_STRING ( "InitialCondition" ) , 0 , 0 , 0 } , { 18 , TARGET_STRING (
"continuousProcess/Reference" ) , TARGET_STRING ( "Amplitude" ) , 0 , 0 , 0 }
, { 19 , TARGET_STRING ( "continuousProcess/Reference" ) , TARGET_STRING (
"Frequency" ) , 0 , 0 , 0 } , { 20 , TARGET_STRING (
"continuousProcess/Actuator disturbance" ) , TARGET_STRING ( "Time" ) , 0 , 0
, 0 } , { 21 , TARGET_STRING ( "continuousProcess/Actuator disturbance" ) ,
TARGET_STRING ( "Before" ) , 0 , 0 , 0 } , { 22 , TARGET_STRING (
"continuousProcess/Actuator disturbance" ) , TARGET_STRING ( "After" ) , 0 ,
0 , 0 } , { 23 , TARGET_STRING ( "continuousProcess/Load disturbance" ) ,
TARGET_STRING ( "Time" ) , 0 , 0 , 0 } , { 24 , TARGET_STRING (
"continuousProcess/Load disturbance" ) , TARGET_STRING ( "Before" ) , 0 , 0 ,
0 } , { 25 , TARGET_STRING ( "continuousProcess/Load disturbance" ) ,
TARGET_STRING ( "After" ) , 0 , 0 , 0 } , { 26 , TARGET_STRING (
"continuousProcess/Transfer Fcn" ) , TARGET_STRING ( "A" ) , 0 , 2 , 0 } , {
27 , TARGET_STRING ( "continuousProcess/Transfer Fcn" ) , TARGET_STRING ( "C"
) , 0 , 3 , 0 } , { 28 , TARGET_STRING (
 "continuousProcess/Fuzzy Logic  Controller  with Ruleviewer/Fuzzy Logic Controller/Output Sample Points"
) , TARGET_STRING ( "Value" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 ,
0 , 0 } } ; static const rtwCAPI_Signals rtRootInputs [ ] = { { 0 , 0 , (
NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_Signals
rtRootOutputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 0 , ( NULL )
, 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . i0ow1e2zwy , & rtB . fnzpldm4jx ,
& rtB . njewhruiao , & rtB . njkj14u4zx , & rtB . jwyt1o5zr2 , & rtB .
deq4hxuqj0 , & rtB . ddrhrmhpq2 , & rtB . lceulpxz11 , & rtB . bz3cnq30su , &
rtB . bga1xo05k4 , & rtB . fiv1dt1tpn , & rtB . o5pisjybo0 , & rtB .
m250dkhfv0 , & rtB . gf133lgqhg [ 0 ] , & rtP . ScaleFactor1_Gain , & rtP .
ScaleFactor2_Gain , & rtP . Integrator_IC , & rtP . Integrator1_IC , & rtP .
Reference_Amplitude , & rtP . Reference_Frequency , & rtP .
Actuatordisturbance_Time , & rtP . Actuatordisturbance_Y0 , & rtP .
Actuatordisturbance_YFinal , & rtP . Loaddisturbance_Time , & rtP .
Loaddisturbance_Y0 , & rtP . Loaddisturbance_YFinal , & rtP . TransferFcn_A [
0 ] , & rtP . TransferFcn_C [ 0 ] , & rtP . OutputSamplePoints_Value , } ;
static int32_T * rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } } ; static
const uint_T rtDimensionArray [ ] = { 1 , 1 , 2 , 1 , 3 , 1 , 1 , 3 } ;
static const real_T rtcapiStoredFloats [ ] = { 0.0 , 1.0 , 2.0 } ; static
const rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) ,
rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static const rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 0 ] , 0 , 0 } , { ( const void * ) &
rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [ 1 ] , 1 ,
0 } , { ( const void * ) & rtcapiStoredFloats [ 2 ] , ( const void * ) &
rtcapiStoredFloats [ 0 ] , 2 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 14 , rtRootInputs , 0 , rtRootOutputs , 0 }
, { rtBlockParameters , 15 , rtModelParameters , 0 } , { ( NULL ) , 0 } , {
rtDataTypeMap , rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap
, rtDimensionArray } , "float" , { 1947772266U , 3534279789U , 3644979218U ,
2294286348U } , ( NULL ) , 0 , 0 } ; const rtwCAPI_ModelMappingStaticInfo *
continuousProcess_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void continuousProcess_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion (
( * rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void continuousProcess_host_InitializeDataMapInfo (
continuousProcess_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
