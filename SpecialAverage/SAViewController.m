//
//  SAViewController.m
//  SpecialAverage
//
//  Created by Jabari on 11/19/13.
//  Copyright (c) 2013 23bit. All rights reserved.
//

#import "SAViewController.h"

@interface SAViewController ()

@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int arr[10] = {3, 9, 15, 3, 9, 6, 6, 3, 15, 5};
    PrintSpecialAverage(arr, sizeof(arr) / sizeof(arr[0]));
    
}

void PrintSpecialAverage(int arr[], int arrlen)
{
    int len = 0;
    int min = 0;
    int max = 0;
    int maxinstances = 0;
    int mininstances = 0;
    int sum = 0;
    float avg;
    
    for (int i=0; i < arrlen; i++) {
        
        if(i == 0) {
            max = min = arr[i];
            maxinstances++;
            mininstances++;
            continue;
        }
        
        if (arr[i] > max) {
            if (maxinstances > 0 && max != min) {
                sum += max * maxinstances;
                len += maxinstances;
            }
            max = arr[i];
            maxinstances = 1;
            continue;
        } else if(arr[i] == max) {
            maxinstances++;
            continue;
        }
        
        if (arr[i] < min) {
            if (mininstances > 0 && max != min) {
                sum += min * mininstances;
                len += mininstances;
            }
            min = arr[i];
            mininstances = 1;
            continue;
        } else if(arr[i] == min) {
            mininstances++;
            continue;
        }
        
        if (arr[i] != max && arr[i] != min) {
            sum += arr[i];
            len++;
        }
    }
    
    if (len > 0)
        avg = (float)sum / (float)len;
    else
        avg = 0;
    
    NSLog(@"max: %d", max);
    NSLog(@"min: %d", min);
    NSLog(@"sum: %d", sum);
    NSLog(@"len: %d", len);
    NSLog(@"avg: %f", avg);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
