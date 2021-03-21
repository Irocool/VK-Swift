//
//  main.m
//  lesson1
//
//  Created by Irina Kuligina on 20.03.2021.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        int intValueFirst = 0;
        int intValueSecond = 0;
        
        printf("First number (>0): ");
        scanf("%d", &intValueFirst);
        printf("Second number: ");
        scanf("%d", &intValueSecond);
        
        NSLog(@"%d", intValueFirst + intValueSecond);
        NSLog(@"%d", intValueSecond - intValueFirst);
        NSLog(@"%d", intValueSecond * intValueFirst);
        NSLog(@"%d", intValueSecond / intValueFirst);
        NSLog(@"First number + Second number = %i, Second number - First number = %i, Second number * First number = %i, Second number / First number = %i", intValueFirst + intValueSecond, intValueSecond - intValueFirst, intValueSecond * intValueFirst, intValueSecond / intValueFirst);
        return 0;
    }
    
}
