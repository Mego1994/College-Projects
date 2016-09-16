#include<stdlib.h>
#include<stdio.h>
#include<curses.h>
#include<string.h>
#include<time.h>

// This file created by Group 13 
// Group members:  1- Mohamed Husni Alzanaty  2- Mohamed Magdy Ahmed  3- Mohamed Mostafa Abdullah  4- Eslam Khalid Khalil

void Shell_Sorting();
void quickSort(int* array, int left, int right);
void heapsort(int* arr, unsigned int N);
FILE *input,*output;         //declare i/o files
int char_number;             // number of characters in the input file.
int sort[100];
char character[0];            // Array of characters. (initial value:0)
char file_path[80];
int i,j,k,temp,num;          //i ,j ,k counter varible ; tmp: temprory varibel ; num: variable to store length of array
char choose;                  // Used in switch_case.
clock_t begin, end;           // Used in calculating elapsed time of sorting.
double time_spent;             // Elapsed time of sorting.


int main()
{
	
	
	printf("\t**** Welcome ****\n");
	printf("This program sorts characters from the input file you will enter its path then create output file in the location of input file and write them sorted in a generated file and calculates elapsed time of sorting.\n");
	printf("Please create a file and write characters in it in any place on your PC.\n");
	printf("Please enter the path of the input file:\n");
	scanf("%s",file_path);

	printf("Please enter the expected maximum number of characters in the file you created.\n");
	scanf("%d",&char_number);
    
    character[char_number];                      //create array to store the unsorted characters
	fgets(file_path,80, stdout);                // get the path of the input file.
	
	
	
	if((input=fopen(file_path,"r"))==NULL)
        {
                printf("File not found.\n");
                exit(1);
		}
		else
		{
			
			
			for(int n=0;n<char_number;n++)              //declare counter to store character from unsorted file
			{
				character[n]=fgetc(input);
				if(character[n]==EOF)
				{
			
					character[n]='\0';           // prevent array to store the EOF
					break;
				}
				
				if(character[n]==' '||character[n]=='\n')    //prevent array to store the space and newline to make sort easy
				{
					n=n-1;
					continue;
				}
				
			}
	
		}
		
		num=strlen(character);              //get the length of the unsorted file 
	    
	    for(;;)
	    {
			
	    printf("\nWrite 1 or 2 or 3 to choose one of the following sorting techniqes:\n"); 
        printf("1-Shell sorting \n2-Quick sorting \n3-Heap sorting\n4-exit\n");	       
		scanf("%c",&choose);
		scanf("%c",&choose);
		switch (choose) {
	       
        case '1': 
	      output = fopen("Shell Sorting", "w");                 // Create the output file: Sorted
	      
	      begin = clock();
	      Shell_Sorting();                    //shell sorting
          end = clock();
          
          time_spent = ((double)(end - begin)*1000)/CLOCKS_PER_SEC;
	      printf("\nTime of Shell Sorting is: %f ms\n",time_spent);
	      
        break;
        
        case '2':
        
		  for(int i=0;i<strlen(character);i++)
		  sort[i]=character[i];
		  output = fopen("Quick Sorting", "w");                 // Create the output file: Sorted
		  
		  begin = clock();
		  quickSort(sort,0,strlen(character));
		  end = clock();
		  
		  time_spent = ((double)(end - begin)*1000)/CLOCKS_PER_SEC;
	      printf("\nTime of Quick Sorting is: %f ms\n",time_spent);
	        
		  fprintf(output,"\t**** Quick Sorting ****\n");           //print sorted character in file
		  
		  for(int i=1; i<strlen(character)+1; i++)
		  {
         	fputc(sort[i],output);
			fprintf(output," ");  
	      }
		break; 
		
		case '3':
		
		  for(int i=0;i<strlen(character);i++)
	        sort[i]=character[i];
	        
	        output = fopen("Heap Sorting", "w");                 // Create the output file: Sorted
	        begin = clock();
	        heapsort(sort, strlen(character));
	        end = clock();
	        time_spent = ((double)(end - begin)*1000)/CLOCKS_PER_SEC;
	        printf("\nTime of Heap Sorting is: %f ms\n",time_spent);
	        
	       fprintf(output,"\t**** Heap Sorting ****\n");           //print sorted character in file
	       
	       for(int i=0; i<strlen(character); i++)
           {
         	fputc(sort[i],output);
			fprintf(output," ");  
	       }       
		   break;
		   
		   case '4':
		   exit(1);
		 
	  }
  
		
		printf("\nCharacters sorted successfully in a file called ""Sorted"" on Desktop.\n");	
		 fclose(output);                                
	}
	
	
}

void Shell_Sorting()
{	
        //i = gap between element 
		for(i=num/2; i>0; i=i/2)             //choose the frist elemantes to compare 
		{
			for(j=i; j<num; j++)
			{
				for(k=j-i; k>=0; k=k-i)
				{
					if(character[k+i]>=character[k])
					break;
					else
					{
						temp=character[k];
						character[k]=character[k+i];//swap
						character[k+i]=temp;
					}
				}
			}
		}

       fprintf(output,"\t**** Shell Sorting ****\n");           //print sorted character in file
       
	   for(k=0; k<num; k++)
	   {
			fputc(character[k],output);
			fprintf(output," ");  
	   }
}

void quickSort(int* array, int left, int right)
{
	int pivot, l_hold, r_hold;
	l_hold = left;
	r_hold = right;
	pivot = array[left];// random pivit
     
	while (left < right)
	{
		while ((array[right] >= pivot) && (left < right))
		right--;

	if (left != right)
	{
		array[left] = array[right];
		left++;
	}

	while ((array[left] <= pivot) && (left < right))
	left++;

		if (left != right)
		{
			array[right] = array[left];
			right--;
		}
	}

		array[left] = pivot;
		pivot = left;//
		left = l_hold;
		right = r_hold;

		if (left < pivot)
		quickSort(array, left, pivot-1);//reursive function
		if (right > pivot)
		quickSort(array, pivot+1, right);
		
		//~ for(int k=0; k<num; k++)
	   //~ {
			//~ fputc(array[k],output);
			//~ fprintf(output,NULL);  
	   //~ }
}

void heapsort(int* arr, unsigned int N) 
{
    int t; /* the temporary value */
    unsigned int n = N, parent = N/2, index, child; /* heap indexes */
    /* loop until array is sorted */
    while (1) { 
        if (parent > 0) { 
            /* first stage - Sorting the heap */
            t = arr[--parent];  /* save old value to t */
        } else {
            /* second stage - Extracting elements in-place */
            n--;                /* make the heap smaller */
            if (n == 0) {
                return; /* When the heap is empty, we are done */
            }
            t = arr[n];         /* save lost heap entry to temporary */
            arr[n] = arr[0];    /* save root entry beyond heap */
        }
        /* insert operation - pushing t down the heap to replace the parent */
        index = parent; /* start at the parent index */
        child = index * 2 + 1; /* get its left child index */
        while (child < n) {
            /* choose the largest child */
            if (child + 1 < n  &&  arr[child + 1] > arr[child]) {
                child++; /* right child exists and is bigger */
            }
            /* is the largest child larger than the entry? */
            if (arr[child] > t) {
                arr[index] = arr[child]; /* overwrite entry with child */
                index = child; /* move index to the child */
                child = index * 2 + 1; /* get the left child and go around again */
            } else {
                break; /* t's place is found */
            }
        }
        /* store the temporary value at its new location */
        arr[index] = t;
        
    }
    
}


