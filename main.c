#include <stdio.h>
#include <stdlib.h>
#include "linked_stack.h"


void test_stack() {
	// 8 11 12
	LINKED_STACK stack = linked_stack_init();
	linked_stack_push(stack, 12);
	linked_stack_push(stack, 8);
	printf("%lu ", linked_stack_pop(stack));
	linked_stack_push(stack, 11);
	printf("%lu ", linked_stack_pop(stack));
	printf("%lu ", linked_stack_pop(stack));
	linked_stack_free(stack);
}
/*
void test_queue() {
	// 12 8 11
	LINKED_QUEUE queue = linked_queue_init();
	linked_queue_enqueue(queue, 12);
	linked_queue_enqueue(queue, 8);
	printf("%lu ", linked_queue_dequeue(queue));
	linked_queue_enqueue(queue, 11);
	printf("%lu ", linked_queue_dequeue(queue));
	printf("%lu ", linked_queue_dequeue(queue));
	linked_queue_free(queue);
}
*/

int main() {
	test_stack();
	//test_queue();
	return 0;
}
