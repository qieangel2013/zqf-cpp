#include "zq2.h"
#include <stdio.h>  
#include <pthread.h>
extern "C"{
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
}  
int i=0;
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
/*线程一*/  
void *thread_1(void*)  
{  
    while(true){
        pthread_mutex_lock(&mutex1);
        if(i>0){
            php_printf("pthread_1 卖出的过火车票为：%d \n",i);
            i--;
        }
        else
            break;  
        pthread_mutex_unlock(&mutex1);
    }
    pthread_mutex_unlock(&mutex1);
    pthread_exit(0);    
}  
  
/*线程二*/  
void *thread_2(void*)  
{  
    while(true){
        pthread_mutex_lock(&mutex1);
        if(i>0){
            php_printf("pthread_2 卖出的过车票为：%d \n",i);
            i--;
        }
        else
            break;  
        pthread_mutex_unlock(&mutex1);
    }
    pthread_mutex_unlock(&mutex1);
    pthread_exit(0);  
}  

zqtests::zqtests():zqtest(20,30){
}
int zqtests::output1(int num){
	pthread_t id_1,id_2;  
    int ret;
    i=num;
/*创建线程一*/  
    ret=pthread_create(&id_1,NULL,thread_1,NULL);  
    if(ret!=0)  
    {  
        php_printf("Create pthread_1 error!\n");  
    return -1;  
    }  
/*创建线程二*/  
     ret=pthread_create(&id_2,NULL,thread_2,NULL);  
    if(ret!=0)  
    {  
        php_printf("Create pthread_2 error!\n");  
    return -1;  
    }  
/*等待线程结束*/  
    pthread_join(id_1,NULL);  
    pthread_join(id_2,NULL);  
    ret = pthread_mutex_destroy(&mutex1);
    if (ret != 0) {
        php_printf("pthread_mutex_destroy error\n");
        return -1;
    }
	return x+y;
}
