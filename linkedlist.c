#include "linkedlist.h"

struct node_t *newNode(void *data)
{
    struct node_t *nodePtr = (struct node_t *)calloc(sizeof(struct node_t), 1);
    nodePtr->data = data;
    return nodePtr;
}

LinkedList *newLinkedList()
{
    LinkedList *ll = (LinkedList *)malloc(sizeof(LinkedList));
    ll->size = 0;
    return ll;
}

void llappend(LinkedList *ll, void *data)
{
    struct node_t *newNodePtr = newNode(data);
    if(ll->size == 0)
    {
        ll->head = newNodePtr;
    }
    else
    {
        newNodePtr->prev = ll->tail;
        ll->tail->next = newNodePtr;
    }
    ll->tail = newNodePtr;
    ll->size++;
}

void *llpop(LinkedList *ll)
{
    void *data = ll->head->data;
    struct node_t *tmp = ll->head;
    ll->head = ll->head->next;
    if(ll->head == NULL)
    {
        ll->tail = NULL;
    }
    free(tmp);
    ll->size--;
    return data;
}

void *llat(LinkedList *ll, int index)
{
    struct node_t* element = ll->head;
    for(int i = 0; i < index; i++)
    {
        element = element->next;
    }
    return element->data;
}

void printLinkedList(LinkedList *ll)
{
    struct node_t *current = ll->head;
    int count = 1;
    printf("LinkedList: {");
    while(current != NULL)
    {
        if(count != ll->size)
        {
            printf("%d, ", *(int *)current->data);
        }
        else
        {
            printf("%d", *(int *)current->data);
        }
        current = current->next;
        count++;
    }
    printf("}");
}
