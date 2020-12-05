#include "continuousProcess_capi_host.h"
static continuousProcess_host_DataMapInfo_T root;
static int initialized = 0;
rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        continuousProcess_host_InitializeDataMapInfo(&(root), "continuousProcess");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
