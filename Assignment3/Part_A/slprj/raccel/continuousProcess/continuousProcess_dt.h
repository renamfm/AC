#include "ext_types.h"
static DataTypeInfo rtDataTypeInfoTable [ ] = { { "real_T" , 0 , 8 } , {
"real32_T" , 1 , 4 } , { "int8_T" , 2 , 1 } , { "uint8_T" , 3 , 1 } , {
"int16_T" , 4 , 2 } , { "uint16_T" , 5 , 2 } , { "int32_T" , 6 , 4 } , {
"uint32_T" , 7 , 4 } , { "boolean_T" , 8 , 1 } , { "fcn_call_T" , 9 , 0 } , {
"int_T" , 10 , 4 } , { "pointer_T" , 11 , 8 } , { "action_T" , 12 , 8 } , {
"timer_uint32_pair_T" , 13 , 8 } , { "struct_ydOeOmkmYJPA1xBJZ2L4AF" , 14 ,
144 } , { "struct_RCP1oovUDF2zF6C9vcJmtG" , 15 , 48 } , {
"struct_OTlcYhhT3UxB0PEhAC2ANE" , 16 , 152 } , {
"struct_qH4Unbydb9KS7ehcrvtFcB" , 17 , 32 } , {
"struct_5glPHvFHAiiblwOGTVSKoE" , 18 , 168 } , {
"struct_Rpvu2Z4wi4F29N866RykKB" , 19 , 1008 } } ; static uint_T
rtDataTypeSizes [ ] = { sizeof ( real_T ) , sizeof ( real32_T ) , sizeof (
int8_T ) , sizeof ( uint8_T ) , sizeof ( int16_T ) , sizeof ( uint16_T ) ,
sizeof ( int32_T ) , sizeof ( uint32_T ) , sizeof ( boolean_T ) , sizeof (
fcn_call_T ) , sizeof ( int_T ) , sizeof ( pointer_T ) , sizeof ( action_T )
, 2 * sizeof ( uint32_T ) , sizeof ( struct_ydOeOmkmYJPA1xBJZ2L4AF ) , sizeof
( struct_RCP1oovUDF2zF6C9vcJmtG ) , sizeof ( struct_OTlcYhhT3UxB0PEhAC2ANE )
, sizeof ( struct_qH4Unbydb9KS7ehcrvtFcB ) , sizeof (
struct_5glPHvFHAiiblwOGTVSKoE ) , sizeof ( struct_Rpvu2Z4wi4F29N866RykKB ) }
; static const char_T * rtDataTypeNames [ ] = { "real_T" , "real32_T" ,
"int8_T" , "uint8_T" , "int16_T" , "uint16_T" , "int32_T" , "uint32_T" ,
"boolean_T" , "fcn_call_T" , "int_T" , "pointer_T" , "action_T" ,
"timer_uint32_pair_T" , "struct_ydOeOmkmYJPA1xBJZ2L4AF" ,
"struct_RCP1oovUDF2zF6C9vcJmtG" , "struct_OTlcYhhT3UxB0PEhAC2ANE" ,
"struct_qH4Unbydb9KS7ehcrvtFcB" , "struct_5glPHvFHAiiblwOGTVSKoE" ,
"struct_Rpvu2Z4wi4F29N866RykKB" } ; static DataTypeTransition rtBTransitions
[ ] = { { ( char_T * ) ( & rtB . ddrhrmhpq2 ) , 0 , 0 , 19 } , { ( char_T * )
( & rtDW . hjgdnkrt10 ) , 0 , 0 , 4 } , { ( char_T * ) ( & rtDW . g0aa02lirf
. LoggedData ) , 11 , 0 , 3 } , { ( char_T * ) ( & rtDW . olj3vrz2kf ) , 10 ,
0 , 2 } } ; static DataTypeTransitionTable rtBTransTable = { 4U ,
rtBTransitions } ; static DataTypeTransition rtPTransitions [ ] = { { (
char_T * ) ( & rtP . OutputSamplePoints_Value ) , 0 , 0 , 19 } } ; static
DataTypeTransitionTable rtPTransTable = { 1U , rtPTransitions } ;
