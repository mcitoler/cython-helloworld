#include "cppclass.hpp"

namespace test {
    CppClass::CppClass() {}
    CppClass::CppClass(int v): value(v){}
    CppClass::~CppClass(){}
    int CppClass::get_value(){
        return this->value;
    }
    void CppClass::add(int value){
        this->value += value;
    }
}
