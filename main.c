#include "stdio.h"
#include "pthread.h"

void *do_thread(void *args)
{
    printf(" * pthreads ok\n");
    return 0;
}

int main()
{
    pthread_t pt;
    int ret;

    ret = pthread_create(&pt, NULL, &do_thread, NULL);
    if (ret > 0)
    {
        printf("Unable to create thread\n");
        return 1;
    }


    pthread_join(pt, NULL);
    return ret;
}
