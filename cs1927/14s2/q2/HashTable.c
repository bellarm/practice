// HashTable.c ... implementation of HashTable library

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "List.h"
#include "HashTable.h"

typedef struct _hash_table_rep {
   int nslots;    // size of chains[] array
   int nvals;     // # keys stored in table
   List *chains;  // array of hash chains
} HashTableRep;

// hash function (int -> [0..nslots-1])
static int hash(int val, int nslots)
{
   return (val%nslots);
}

// create an empty hash table
HashTable newHashTable(int N)
{
   HashTable new;
   int i;
   new = malloc(sizeof(HashTableRep));
   assert(new != NULL);
   new->nslots = N;
   new->nvals = 0;
   new->chains = malloc(N*sizeof(List));
   assert(new->chains != NULL);
   for (i = 0; i < N; i++)
      new->chains[i] = newList();
   return new;
}

// free memory for a hash table
void dropHashTable(HashTable ht)
{
   assert(ht != NULL);
   int i;
   for (i = 0; i < ht->nslots; i++)
      dropList(ht->chains[i]);
   free(ht->chains);
   free(ht);
}

// display a hash table on stdout
void showHashTable(HashTable ht)
{
   assert(ht != NULL);
   int i;
   for (i = 0; i < ht->nslots; i++) {
      printf("[%2d] ",i);
      showList(ht->chains[i]);
   }
}

// add a new value into a HashTable
void insertHashTable(HashTable ht, int val)
{
   void expand(HashTable);
   assert(ht != NULL);
   if (ht->nvals > 2*ht->nslots) expand(ht);
   int h = hash(val,ht->nslots);
   appendList(ht->chains[h],val);
   ht->nvals++;
}

// double the number of slots/chains in a hash table
void expand(HashTable ht)
{
   //TODO
   List *new = calloc(ht->nslots*2,sizeof(List*));
   assert(new != NULL);
   int i, j, num = 0; int *elmts;
   // create a new list for the new nslots
   for (i = 0; i < ht->nslots*2; i++) {
      new[i] = newList();
   }
   // move the old chains to the new one
   for (i = 0; i < ht->nslots; i++) {
      elmts = valuesFromList(ht->chains[i],&num);
      for (j = 0; j < num; j++) {
         int h = hash(elmts[j],ht->nslots*2);
         appendList(new[h],elmts[j]);
      }
   }


   ht->nslots *= 2;
   ht->chains = new;
}
