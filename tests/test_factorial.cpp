#include <cassert>
#include "factorial.h"

int main() {
    assert(factorial(0) == 1);
    assert(factorial(1) == 1);
    assert(factorial(5) == 120);
    return 0;
}