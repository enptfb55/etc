#include <iostream>
#include <string>


class HelloWorld
{
public:
    explicit HelloWorld( const std::string& str ) :
        str_( str )
    {
        // empty
    }


    ~HelloWorld()
    {
        // empty
    }


    HelloWorld( const HelloWorld& other ) :
        str_( other.str_ )
    {
//         std::cout << "{copy ctor}" << std::endl;
    }


    HelloWorld& operator=( const HelloWorld& rhs )
    {
//         std::cout << "{assignment operator}" << std::endl;
        if ( &rhs == this ) return *this;

        str_ = rhs.str_;
        return *this;
    }


    const std::string& get_string() const
    {
        return str_;
    }

private:
    std::string str_;

};


int main( int argc, char** argv )
{
    HelloWorld hw1( "hello world" );
    HelloWorld hw2( hw1 );
    HelloWorld hw3( "" );
    hw3 = hw1;

    std::cout << hw1.get_string() << std::endl;
    std::cout << hw2.get_string() << std::endl;
    std::cout << hw3.get_string() << std::endl;

    return 0;
}
