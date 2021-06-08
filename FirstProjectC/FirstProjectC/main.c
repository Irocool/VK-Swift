//
//  main.c
//  FirstProjectC
//
//  Created by Пользователь on 02.04.2021.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    int lines;
    printf("Enter number of lines: ");
    scanf("%d", &lines);
    int i;
    int j;
    for (i = 0; i < lines; i++){
        for (j = 1; j < lines - i; j++)
        printf(" ");
        
        for (j = lines - i * 2; j <= lines; j++)
        printf("^");
        
        printf("\n");
        
    }
    return 0;
}
