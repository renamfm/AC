#include "rt_logging_mmi.h"
#include "continuousProcess_capi.h"
#include <math.h>
#include "continuousProcess.h"
#include "continuousProcess_private.h"
#include "continuousProcess_dt.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 3 , & stopRequested ) ; }
rtExtModeShutdown ( 3 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 4 ; const char_T
* gbl_raccel_Version = "10.2 (R2020b) 29-Jul-2020" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const int_T gblNumRootInportBlks = 0 ; const int_T
gblNumModelInputs = 0 ; extern const char * gblInportFileName ; extern
rtInportTUtable * gblInportTUtables ; const int_T gblInportDataTypeIdx [ ] =
{ - 1 } ; const int_T gblInportDims [ ] = { - 1 } ; const int_T
gblInportComplex [ ] = { - 1 } ; const int_T gblInportInterpoFlag [ ] = { - 1
} ; const int_T gblInportContinuous [ ] = { - 1 } ; int_T enableFcnCallFlag [
] = { 1 , 1 , 1 , 1 } ; const char * raccelLoadInputsAndAperiodicHitTimes (
SimStruct * S , const char * inportFileName , int * matFileFormat ) { return
rt_RAccelReadInportsMatFile ( S , inportFileName , matFileFormat ) ; } B rtB
; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS = &
model_S ; static real_T l4vgctjmps ( real_T x , const real_T params [ 3 ] ) ;
static real_T l4vgctjmps ( real_T x , const real_T params [ 3 ] ) { real_T y
; y = 0.0 ; if ( ( params [ 0 ] != params [ 1 ] ) && ( params [ 0 ] < x ) &&
( x < params [ 1 ] ) ) { y = 1.0 / ( params [ 1 ] - params [ 0 ] ) * ( x -
params [ 0 ] ) ; } if ( ( params [ 1 ] != params [ 2 ] ) && ( params [ 1 ] <
x ) && ( x < params [ 2 ] ) ) { y = 1.0 / ( params [ 2 ] - params [ 1 ] ) * (
params [ 2 ] - x ) ; } if ( x == params [ 1 ] ) { y = 1.0 ; } return y ; }
void MdlInitialize ( void ) { rtX . frwopi03rt [ 0 ] = 0.0 ; rtX . frwopi03rt
[ 1 ] = 0.0 ; rtX . frwopi03rt [ 2 ] = 0.0 ; rtDW . hjgdnkrt10 = ( rtInf ) ;
rtDW . lamghnkq0l = ( rtInf ) ; rtX . pb4aweel5w = rtP . Integrator1_IC ; rtX
. d03vwv2liu = rtP . Integrator_IC ; } void MdlStart ( void ) { { bool
externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { static const real_T c
[ 3 ] = { 0.1669 , 1.0 , 1.833 } ; static const real_T d [ 3 ] = { - 0.8334 ,
- 1.388E-17 , 0.8334 } ; static const real_T e [ 3 ] = { - 1.833 , - 1.0 , -
0.1666 } ; static const int8_T b [ 18 ] = { 1 , 1 , 1 , 2 , 2 , 2 , 3 , 3 , 3
, 1 , 2 , 3 , 1 , 2 , 3 , 1 , 2 , 3 } ; static const int8_T b_p [ 9 ] = { 1 ,
2 , 3 , 2 , 3 , 4 , 3 , 4 , 5 } ; real_T inputMFCache [ 6 ] ; real_T
outputMFCache [ 5 ] ; real_T aggregatedOutputs ; real_T gvxspmzgpr ; real_T
owla3xuvqu ; real_T * lastU ; int_T iy ; owla3xuvqu = rtP .
Reference_Frequency * ssGetT ( rtS ) ; rtB . ddrhrmhpq2 = ( 1.0 - (
owla3xuvqu - muDoubleScalarFloor ( owla3xuvqu ) ) * 2.0 ) * rtP .
Reference_Amplitude ; rtB . m250dkhfv0 = 0.0 ; rtB . m250dkhfv0 += rtP .
TransferFcn_C [ 0 ] * rtX . frwopi03rt [ 0 ] ; rtB . m250dkhfv0 += rtP .
TransferFcn_C [ 1 ] * rtX . frwopi03rt [ 1 ] ; rtB . m250dkhfv0 += rtP .
TransferFcn_C [ 2 ] * rtX . frwopi03rt [ 2 ] ; if ( ssIsSampleHit ( rtS , 1 ,
0 ) ) { rtDW . olj3vrz2kf = ( ssGetTaskTime ( rtS , 1 ) >= rtP .
Loaddisturbance_Time ) ; if ( rtDW . olj3vrz2kf == 1 ) { rtB . bz3cnq30su =
rtP . Loaddisturbance_YFinal ; } else { rtB . bz3cnq30su = rtP .
Loaddisturbance_Y0 ; } } rtB . o5pisjybo0 = rtB . m250dkhfv0 - rtB .
bz3cnq30su ; rtB . bga1xo05k4 = rtB . ddrhrmhpq2 - rtB . o5pisjybo0 ; rtB .
fnzpldm4jx = rtP . ScaleFactor1_Gain * rtB . bga1xo05k4 ; if ( ( rtDW .
hjgdnkrt10 >= ssGetT ( rtS ) ) && ( rtDW . lamghnkq0l >= ssGetT ( rtS ) ) ) {
rtB . i0ow1e2zwy = 0.0 ; } else { owla3xuvqu = rtDW . hjgdnkrt10 ; lastU = &
rtDW . kkx1lghlhp ; if ( rtDW . hjgdnkrt10 < rtDW . lamghnkq0l ) { if ( rtDW
. lamghnkq0l < ssGetT ( rtS ) ) { owla3xuvqu = rtDW . lamghnkq0l ; lastU = &
rtDW . e4l0aullb2 ; } } else { if ( rtDW . hjgdnkrt10 >= ssGetT ( rtS ) ) {
owla3xuvqu = rtDW . lamghnkq0l ; lastU = & rtDW . e4l0aullb2 ; } } rtB .
i0ow1e2zwy = ( rtB . fnzpldm4jx - * lastU ) / ( ssGetT ( rtS ) - owla3xuvqu )
; } rtB . ptzyrru1as [ 0 ] = rtB . fnzpldm4jx ; rtB . ptzyrru1as [ 1 ] = rtB
. i0ow1e2zwy ; owla3xuvqu = 0.0 ; inputMFCache [ 0 ] = l4vgctjmps ( rtB .
ptzyrru1as [ 0 ] , e ) ; inputMFCache [ 1 ] = l4vgctjmps ( rtB . ptzyrru1as [
0 ] , d ) ; inputMFCache [ 2 ] = l4vgctjmps ( rtB . ptzyrru1as [ 0 ] , c ) ;
inputMFCache [ 3 ] = l4vgctjmps ( rtB . ptzyrru1as [ 1 ] , e ) ; inputMFCache
[ 4 ] = l4vgctjmps ( rtB . ptzyrru1as [ 1 ] , d ) ; inputMFCache [ 5 ] =
l4vgctjmps ( rtB . ptzyrru1as [ 1 ] , c ) ; rtB . dyw0cfbvtr [ 0 ] = rtB .
fnzpldm4jx ; rtB . dyw0cfbvtr [ 1 ] = rtB . i0ow1e2zwy ; aggregatedOutputs =
0.0 ; outputMFCache [ 0 ] = - 1.0 ; outputMFCache [ 1 ] = - 0.5 ;
outputMFCache [ 2 ] = 0.0 ; outputMFCache [ 3 ] = 0.5 ; outputMFCache [ 4 ] =
1.0 ; for ( iy = 0 ; iy < 9 ; iy ++ ) { gvxspmzgpr = inputMFCache [ b [ iy +
9 ] + 2 ] * inputMFCache [ b [ iy ] - 1 ] ; owla3xuvqu += gvxspmzgpr ;
aggregatedOutputs += outputMFCache [ b_p [ iy ] - 1 ] * gvxspmzgpr ; } if (
owla3xuvqu == 0.0 ) { owla3xuvqu = 0.0 ; } else { owla3xuvqu = 1.0 /
owla3xuvqu * aggregatedOutputs ; } rtB . njewhruiao = rtP . ScaleFactor2_Gain
* owla3xuvqu ; rtB . jwyt1o5zr2 = rtX . pb4aweel5w ; if ( ssIsSampleHit ( rtS
, 1 , 0 ) ) { rtDW . koygu0vdjl = ( ssGetTaskTime ( rtS , 1 ) >= rtP .
Actuatordisturbance_Time ) ; if ( rtDW . koygu0vdjl == 1 ) { rtB . lceulpxz11
= rtP . Actuatordisturbance_YFinal ; } else { rtB . lceulpxz11 = rtP .
Actuatordisturbance_Y0 ; } } rtB . fiv1dt1tpn = rtB . jwyt1o5zr2 - rtB .
lceulpxz11 ; rtB . njkj14u4zx = rtX . d03vwv2liu ; if ( ssIsSampleHit ( rtS ,
2 , 0 ) ) { rtB . gf133lgqhg [ 0 ] = rtB . fnzpldm4jx ; rtB . gf133lgqhg [ 1
] = rtB . i0ow1e2zwy ; } rtB . deq4hxuqj0 = rtB . bga1xo05k4 * rtB .
bga1xo05k4 ; UNUSED_PARAMETER ( tid ) ; } void MdlOutputsTID3 ( int_T tid ) {
UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) { real_T * lastU ;
if ( rtDW . hjgdnkrt10 == ( rtInf ) ) { rtDW . hjgdnkrt10 = ssGetT ( rtS ) ;
lastU = & rtDW . kkx1lghlhp ; } else if ( rtDW . lamghnkq0l == ( rtInf ) ) {
rtDW . lamghnkq0l = ssGetT ( rtS ) ; lastU = & rtDW . e4l0aullb2 ; } else if
( rtDW . hjgdnkrt10 < rtDW . lamghnkq0l ) { rtDW . hjgdnkrt10 = ssGetT ( rtS
) ; lastU = & rtDW . kkx1lghlhp ; } else { rtDW . lamghnkq0l = ssGetT ( rtS )
; lastU = & rtDW . e4l0aullb2 ; } * lastU = rtB . fnzpldm4jx ; if (
ssIsSampleHit ( rtS , 2 , 0 ) ) { } UNUSED_PARAMETER ( tid ) ; } void
MdlUpdateTID3 ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void
MdlDerivatives ( void ) { XDot * _rtXdot ; _rtXdot = ( ( XDot * ) ssGetdX (
rtS ) ) ; _rtXdot -> frwopi03rt [ 0 ] = 0.0 ; _rtXdot -> frwopi03rt [ 0 ] +=
rtP . TransferFcn_A [ 0 ] * rtX . frwopi03rt [ 0 ] ; _rtXdot -> frwopi03rt [
1 ] = 0.0 ; _rtXdot -> frwopi03rt [ 0 ] += rtP . TransferFcn_A [ 1 ] * rtX .
frwopi03rt [ 1 ] ; _rtXdot -> frwopi03rt [ 2 ] = 0.0 ; _rtXdot -> frwopi03rt
[ 0 ] += rtP . TransferFcn_A [ 2 ] * rtX . frwopi03rt [ 2 ] ; _rtXdot ->
frwopi03rt [ 1 ] += rtX . frwopi03rt [ 0 ] ; _rtXdot -> frwopi03rt [ 2 ] +=
rtX . frwopi03rt [ 1 ] ; _rtXdot -> frwopi03rt [ 0 ] += rtB . fiv1dt1tpn ;
_rtXdot -> pb4aweel5w = rtB . njewhruiao ; _rtXdot -> d03vwv2liu = rtB .
deq4hxuqj0 ; } void MdlProjection ( void ) { } void MdlZeroCrossings ( void )
{ ZCV * _rtZCSV ; _rtZCSV = ( ( ZCV * ) ssGetSolverZcSignalVector ( rtS ) ) ;
_rtZCSV -> m5f1dfp4mq = ssGetT ( rtS ) - rtP . Loaddisturbance_Time ; _rtZCSV
-> lkp30x1rhw = ssGetT ( rtS ) - rtP . Actuatordisturbance_Time ; } void
MdlTerminate ( void ) { } void MdlInitializeSizes ( void ) {
ssSetNumContStates ( rtS , 5 ) ; ssSetNumPeriodicContStates ( rtS , 0 ) ;
ssSetNumY ( rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS
, 0 ) ; ssSetNumSampleTimes ( rtS , 3 ) ; ssSetNumBlocks ( rtS , 29 ) ;
ssSetNumBlockIO ( rtS , 16 ) ; ssSetNumBlockParams ( rtS , 19 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.0 ) ; ssSetSampleTime ( rtS , 2 , 2.0 ) ;
ssSetOffsetTime ( rtS , 0 , 0.0 ) ; ssSetOffsetTime ( rtS , 1 , 1.0 ) ;
ssSetOffsetTime ( rtS , 2 , 0.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 1947772266U ) ; ssSetChecksumVal ( rtS , 1 ,
3534279789U ) ; ssSetChecksumVal ( rtS , 2 , 3644979218U ) ; ssSetChecksumVal
( rtS , 3 , 2294286348U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; ( void ) memset ( ( char * ) rtS , 0 ,
sizeof ( SimStruct ) ) ; ( void ) memset ( ( char * ) & mdlInfo , 0 , sizeof
( struct _ssMdlInfo ) ) ; ssSetMdlInfoPtr ( rtS , & mdlInfo ) ;
ssSetExecutionInfo ( rtS , executionInfo ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ssSetWorkSizeInBytes ( rtS , sizeof ( rtB ) ,
"BlockIO" ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof ( B ) ) ; }
{ real_T * x = ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ; ( void )
memset ( ( void * ) x , 0 , sizeof ( X ) ) ; } { void * dwork = ( void * ) &
rtDW ; ssSetRootDWork ( rtS , dwork ) ; ssSetWorkSizeInBytes ( rtS , sizeof (
rtDW ) , "DWork" ) ; ( void ) memset ( dwork , 0 , sizeof ( DW ) ) ; } {
static DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) & dtInfo , 0
, sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ; dtInfo .
numDataTypes = 20 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ] ; dtInfo
. dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = &
rtBTransTable ; dtInfo . PTransTable = & rtPTransTable ; dtInfo .
dataTypeInfoTable = rtDataTypeInfoTable ; }
continuousProcess_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive (
rtS , true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "continuousProcess" ) ;
ssSetPath ( rtS , "continuousProcess" ) ; ssSetTStart ( rtS , 0.0 ) ;
ssSetTFinal ( rtS , 250.0 ) ; { static RTWLogInfo rt_DataLoggingInfo ;
rt_DataLoggingInfo . loggingInterval = NULL ; ssSetRTWLogInfo ( rtS , &
rt_DataLoggingInfo ) ; } { { static int_T rt_LoggedStateWidths [ ] = { 3 , 1
, 1 } ; static int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 } ; static
int_T rt_LoggedStateDimensions [ ] = { 3 , 1 , 1 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 } ; static BuiltInDTypeId
rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE , SS_DOUBLE } ;
static int_T rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 } ; static
RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] = { ( NULL ) ,
( NULL ) , ( NULL ) } ; static const char_T * rt_LoggedStateLabels [ ] = {
"CSTATE" , "CSTATE" , "CSTATE" } ; static const char_T *
rt_LoggedStateBlockNames [ ] = { "continuousProcess/Transfer Fcn" ,
"continuousProcess/Integrator1" , "continuousProcess/Integrator" } ; static
const char_T * rt_LoggedStateNames [ ] = { "" , "" , "" } ; static boolean_T
rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 } ; static RTWLogDataTypeConvert
rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 ,
1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } ,
{ 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } } ; static
RTWLogSignalInfo rt_LoggedStateSignalInfo = { 3 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert } ; static void *
rt_LoggedStateSignalPtrs [ 3 ] ; rtliSetLogXSignalPtrs ( ssGetRTWLogInfo (
rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . frwopi03rt [ 0 ] ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . pb4aweel5w ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtX . d03vwv2liu ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 5 ] ;
static real_T absTol [ 5 ] = { 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 } ;
static uint8_T absTolControl [ 5 ] = { 0U , 0U , 0U , 0U , 0U } ; static
real_T contStateJacPerturbBoundMinVec [ 5 ] ; static real_T
contStateJacPerturbBoundMaxVec [ 5 ] ; static uint8_T zcAttributes [ 2 ] = {
( ZC_EVENT_ALL_UP ) , ( ZC_EVENT_ALL_UP ) } ; static ssNonContDerivSigInfo
nonContDerivSigInfo [ 2 ] = { { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
lceulpxz11 ) , ( NULL ) } , { 1 * sizeof ( real_T ) , ( char * ) ( & rtB .
bz3cnq30su ) , ( NULL ) } } ; { int i ; for ( i = 0 ; i < 5 ; ++ i ) {
contStateJacPerturbBoundMinVec [ i ] = 0 ; contStateJacPerturbBoundMaxVec [ i
] = rtGetInf ( ) ; } } ssSetSolverRelTol ( rtS , 0.001 ) ; ssSetStepSize (
rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ; ssSetMaxNumMinSteps ( rtS , -
1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ; ssSetMaxStepSize ( rtS , 2.0 )
; ssSetSolverMaxOrder ( rtS , - 1 ) ; ssSetSolverRefineFactor ( rtS , 1 ) ;
ssSetOutputTimes ( rtS , ( NULL ) ) ; ssSetNumOutputTimes ( rtS , 0 ) ;
ssSetOutputTimesOnly ( rtS , 0 ) ; ssSetOutputTimesIndex ( rtS , 0 ) ;
ssSetZCCacheNeedsReset ( rtS , 0 ) ; ssSetDerivCacheNeedsReset ( rtS , 0 ) ;
ssSetNumNonContDerivSigInfos ( rtS , 2 ) ; ssSetNonContDerivSigInfos ( rtS ,
nonContDerivSigInfo ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ;
ssSetSolverName ( rtS , "VariableStepAuto" ) ; ssSetVariableStepSolver ( rtS
, 1 ) ; ssSetSolverConsistencyChecking ( rtS , 0 ) ;
ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ; ssSetSolverRobustResetMethod (
rtS , 0 ) ; ssSetAbsTolVector ( rtS , absTol ) ; ssSetAbsTolControlVector (
rtS , absTolControl ) ; ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetModelDerivatives ( rtS ,
MdlDerivatives ) ; ssSetSolverZcSignalAttrib ( rtS , zcAttributes ) ;
ssSetSolverNumZcSignals ( rtS , 2 ) ; ssSetModelZeroCrossings ( rtS ,
MdlZeroCrossings ) ; ssSetSolverConsecutiveZCsStepRelTol ( rtS ,
2.8421709430404007E-13 ) ; ssSetSolverMaxConsecutiveZCs ( rtS , 1000 ) ;
ssSetSolverConsecutiveZCsError ( rtS , 2 ) ; ssSetSolverMaskedZcDiagnostic (
rtS , 1 ) ; ssSetSolverIgnoredZcDiagnostic ( rtS , 1 ) ;
ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 2 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 1947772266U ) ; ssSetChecksumVal ( rtS , 1 ,
3534279789U ) ; ssSetChecksumVal ( rtS , 2 , 3644979218U ) ; ssSetChecksumVal
( rtS , 3 , 2294286348U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 5 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = & rtAlwaysEnabled ;
systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = & rtAlwaysEnabled ;
systemRan [ 4 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; } return
rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 3 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID3 ( tid ) ; }
