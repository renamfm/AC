#ifndef RTW_HEADER_continuousProcess_cap_host_h_
#define RTW_HEADER_continuousProcess_cap_host_h_
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap.h"
typedef struct { rtwCAPI_ModelMappingInfo mmi ; }
continuousProcess_host_DataMapInfo_T ;
#ifdef __cplusplus
extern "C" {
#endif
void continuousProcess_host_InitializeDataMapInfo (
continuousProcess_host_DataMapInfo_T * dataMap , const char * path ) ;
#ifdef __cplusplus
}
#endif
#endif
#endif
