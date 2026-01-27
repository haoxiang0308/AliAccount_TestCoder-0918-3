#ifndef SWAP_H
#define SWAP_H

#include <utility>

template<typename T>
void swap(T& a, T& b) {
    std::swap(a, b);
}

#endif // SWAP_H