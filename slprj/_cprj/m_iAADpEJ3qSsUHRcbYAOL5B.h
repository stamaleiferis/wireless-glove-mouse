#ifndef __iAADpEJ3qSsUHRcbYAOL5B_h__
#define __iAADpEJ3qSsUHRcbYAOL5B_h__

/* Include files */
#include "simstruc.h"
#include "rtwtypes.h"
#include "multiword_types.h"
#include "slexec_vm_zc_functions.h"
#include "slexec_vm_simstruct_bridge.h"

/* Type Definitions */
#ifndef typedef_codertarget_internal_androidBLEReceive
#define typedef_codertarget_internal_androidBLEReceive

typedef struct {
  int32_T isInitialized;
} codertarget_internal_androidBLEReceive;

#endif                                 /*typedef_codertarget_internal_androidBLEReceive*/

#ifndef typedef_InstanceStruct_iAADpEJ3qSsUHRcbYAOL5B
#define typedef_InstanceStruct_iAADpEJ3qSsUHRcbYAOL5B

typedef struct {
  SimStruct *S;
  codertarget_internal_androidBLEReceive sysobj;
  boolean_T sysobj_not_empty;
  void *emlrtRootTLSGlobal;
  int8_T (*b_y0)[7];
  uint8_T *b_y1;
} InstanceStruct_iAADpEJ3qSsUHRcbYAOL5B;

#endif                                 /*typedef_InstanceStruct_iAADpEJ3qSsUHRcbYAOL5B*/

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
extern void method_dispatcher_iAADpEJ3qSsUHRcbYAOL5B(SimStruct *S, int_T method,
  void* data);

#endif
