#ifndef __Nrw6w6lkCVoO3Jtj7RkG3_h__
#define __Nrw6w6lkCVoO3Jtj7RkG3_h__

/* Include files */
#include "simstruc.h"
#include "rtwtypes.h"
#include "multiword_types.h"
#include "slexec_vm_zc_functions.h"
#include "slexec_vm_simstruct_bridge.h"

/* Type Definitions */
#ifndef typedef_cell_wrap
#define typedef_cell_wrap

typedef struct {
  uint32_T f1[8];
} cell_wrap;

#endif                                 /*typedef_cell_wrap*/

#ifndef typedef_codertarget_internal_androidDataDisplay
#define typedef_codertarget_internal_androidDataDisplay

typedef struct {
  int32_T isInitialized;
  cell_wrap inputVarSize[1];
} codertarget_internal_androidDataDisplay;

#endif                                 /*typedef_codertarget_internal_androidDataDisplay*/

#ifndef typedef_InstanceStruct_Nrw6w6lkCVoO3Jtj7RkG3
#define typedef_InstanceStruct_Nrw6w6lkCVoO3Jtj7RkG3

typedef struct {
  SimStruct *S;
  codertarget_internal_androidDataDisplay sysobj;
  boolean_T sysobj_not_empty;
  void *emlrtRootTLSGlobal;
  uint8_T *u0;
} InstanceStruct_Nrw6w6lkCVoO3Jtj7RkG3;

#endif                                 /*typedef_InstanceStruct_Nrw6w6lkCVoO3Jtj7RkG3*/

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
extern void method_dispatcher_Nrw6w6lkCVoO3Jtj7RkG3(SimStruct *S, int_T method,
  void* data);

#endif
