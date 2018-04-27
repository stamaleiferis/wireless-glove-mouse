/* Include files */

#include "androidblereceiveheartrate_cgxe.h"
#include "m_iAADpEJ3qSsUHRcbYAOL5B.h"
#include "m_Nrw6w6lkCVoO3Jtj7RkG3.h"

unsigned int cgxe_androidblereceiveheartrate_method_dispatcher(SimStruct* S,
  int_T method, void* data)
{
  if (ssGetChecksum0(S) == 229128304 &&
      ssGetChecksum1(S) == 1129616949 &&
      ssGetChecksum2(S) == 824674860 &&
      ssGetChecksum3(S) == 89710950) {
    method_dispatcher_iAADpEJ3qSsUHRcbYAOL5B(S, method, data);
    return 1;
  }

  if (ssGetChecksum0(S) == 2489443153 &&
      ssGetChecksum1(S) == 2175682753 &&
      ssGetChecksum2(S) == 4038731537 &&
      ssGetChecksum3(S) == 2025266633) {
    method_dispatcher_Nrw6w6lkCVoO3Jtj7RkG3(S, method, data);
    return 1;
  }

  return 0;
}
