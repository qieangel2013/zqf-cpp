#include "zq1.h"
#include <iostream>
zqtest::zqtest(int a,int b){
	x=a;
	y=b;
}
void zqtest::output(){
	std::cout<<x<<std::endl<<y<<std::endl;
}