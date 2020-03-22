#ifndef CPPCLASS_HPP
#define CPPCLASS_HPP

namespace test {
    class CppClass {
        private:
            int value;
        public:
            CppClass();
            CppClass(int v);
            ~CppClass();

            int get_value();
            void add(int value);
    };
}

#endif