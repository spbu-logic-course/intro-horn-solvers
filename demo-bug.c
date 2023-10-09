#include <stdio.h>
#include "seahorn/seahorn.h"
extern int nd();

int main() {
  int x = nd();
  printf("x = %d\n", x);
  if (!(x <= 0))
    return 0;
  while (x < 5) {
    x++;
  }
  // if (!(x < 4))
  //   sassert(false);
  sassert(x < 4);
  // sassert(x < 10);
  return 0;
}

// sea pf -m64 demo-bug.c --cex=cex.ll
// sea exe -m64 demo-bug.c cex.ll -o demo
// ./demo
// *fix bug*
// sea pf -m64 demo-bug.c --cex=cex.ll --show-invars
// sea smt -m64 demo-bug.c -o demo.smt2
// vim smt2
// *add :print-certificate true to query*
// z3 demo.smt2
// can we write the problem by hand? let's do it for while.smt2
// but first, let's investigate syntax in inc.smt2
