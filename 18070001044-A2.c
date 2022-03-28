#include <stdio.h>
#include <stdlib.h>
#include <time.h>

 #define uint64_t unsigned long
 #define uint32_t unsigned int
 uint64_t cycles_now(void) {
     #if defined(__GNUC__)
     uint32_t lo, hi;
     __asm__ __volatile__("rdtsc" : "=a" (lo), "=d" (hi));
     return ((uint64_t)lo | ((uint64_t)hi << 32));
     #else
     return 0;
     #endif
     }





typedef struct NODE_s *NODE;
typedef struct NODE_s {
    NODE left;
    NODE right;
    unsigned long key;
    void *data;
    int height;
} NODE_t[1];

typedef struct {
    NODE root;
} TREE_t[1], *TREE;


int max(int a, int b);


int height(NODE N)
{
    if (N == NULL)
        return 0;
    return N->height;
}


int max(int a, int b)
{
    return (a > b)? a : b;
}


NODE initNode(int key)
{
    NODE node = (NODE)malloc(sizeof(NODE));
    node->key    = key;
    node->left   = NULL;
    node->right  = NULL;
    node->height = 1;
    return(node);
}


NODE rightRotate(NODE y)
{
    NODE x = y->left;
    NODE T2 = x->right;


    x->right = y;
    y->left = T2;


    y->height = max(height(y->left), height(y->right))+1;
    x->height = max(height(x->left), height(x->right))+1;


    return x;
}


NODE leftRotate(NODE x)
{
    NODE y = x->right;
    NODE T2 = y->left;


    y->left = x;
    x->right = T2;


    x->height = max(height(x->left), height(x->right))+1;
    y->height = max(height(y->left), height(y->right))+1;


    return y;
}


int getBalance(NODE N)
{
    if (N == NULL) {
        return 0;
    }
    return height(N->left) - height(N->right);
}


NODE avl_insert(NODE node, int key)
{

    if (node == NULL) {
        return (initNode(key));
    }

    if (key < node->key) {
        node->left = avl_insert(node->left, key);
    }
    else if (key > node->key) {
        node->right = avl_insert(node->right, key);
    }
    else {
        return node;
    }


    node->height = 1 + max(height(node->left),
                           height(node->right));

    int balance = getBalance(node);

    // LL
    if (balance > 1 && key < node->left->key) {
        return rightRotate(node);
    }

    // RR
    if (balance < -1 && key > node->right->key) {
        return leftRotate(node);
    }
    // LR
    if (balance > 1 && key > node->left->key)
    {
        node->left =  leftRotate(node->left);
        return rightRotate(node);
    }

    // RL
    if (balance < -1 && key < node->right->key)
    {
        node->right = rightRotate(node->right);
        return leftRotate(node);
    }

    return node;
}

NODE binary_search(NODE root, unsigned long key){

    if(root == NULL || root->key == key){
        return root;
    }
    if(root->key < key){
        return binary_search(root->right, key);
    }
    if(root->key > key){
        return binary_search(root->left, key);
    }
}




int main()
{
    uint64_t st, fn;
    NODE *root = NULL;

    int size = 10000000, i;
    unsigned long *keys = malloc(sizeof(unsigned long) * size);


    for (i = 0; i < size ; i++) {
        keys[i] = (unsigned long) rand() * (unsigned long) rand();
    }

    for (i=0; i < 1000000; ++i){
        avl_insert(root, keys[i]);
    }


    st = cycles_now();
    binary_search(root, keys[154435]);
    fn = cycles_now();



    printf(" %lu clock cycles\n", fn - st);
    return 0;
}
