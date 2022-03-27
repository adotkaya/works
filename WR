#include<semaphore.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<pthread.h>
sem_t x;
sem_t y;
int readercount = 0;

void *reader()
{
    sem_wait(&x);
    readercount++;
    if(readercount==1) {
        sem_wait(&y);
    }
    sem_post(&x);
    printf("%d reader is inside\n",readercount);
    sleep(1);
    sem_wait(&x);
    readercount--;
    if(readercount==0){
        sem_post(&y);
    }
    sem_post(&x);
    printf("%d Reader is leaving\n",readercount+1);
}

void *writer()
{
    printf("Writer is trying to enter\n");
    sem_wait(&y);
    printf("Writer has entered\n");
    sem_post(&y);
    printf("Writer is leaving\n");
}
