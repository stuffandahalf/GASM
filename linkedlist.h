#ifndef LINKEDLIST_H
#define LINKEDLIST_H

#include <stdio.h>
#include <stdlib.h>

struct node_t {
    struct node_t *prev;
    struct node_t *next;
    void *data;
};

typedef struct linkedlist_t {
    struct node_t *head;
    struct node_t *tail;
    int size;
} LinkedList;

struct node_t *new_node(void *data);

LinkedList *newLinkedList();
void *llat(LinkedList *ll, int index);
void llappend(LinkedList *ll, void *data);
void printLinkedList(LinkedList *ll);
void *llpop(LinkedList *ll);

#endif
