//
//  DetailViewController.m
//  WordCount
//
//  Created by Vidya Murthy on 13/10/15.
//  Copyright © 2015 Vidya Murthy. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) IBOutlet UILabel *speakerName;
@property (nonatomic, strong) IBOutlet UILabel *speechDate;
@property (nonatomic, strong) IBOutlet UIImageView *speakerImage;
@property (nonatomic, strong) IBOutlet UITextView *speechTextView;
@property (nonatomic, strong) IBOutlet UIProgressView *progressView;
@property (nonatomic, strong) IBOutlet UILabel *frequentword;

@end

@implementation DetailViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.speakerName.text = self.speech.speaker;
    self.speechDate.text = self.speech.speechDate;
    self.speakerImage.image = [UIImage imageNamed:self.speech.speakerImage];
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:self.speech.speechFileName ofType:nil];
    
    NSError *error = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:pathString
                                                       encoding:NSUTF8StringEncoding
                                                          error:&error];
    if (fileContents == nil) {
        NSLog(@"Error reading %@: %@", self.speech.speechFileName, error);
    } else {
        self.speechTextView.text = fileContents;
        [self calculateFrequentWords:fileContents];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculateFrequentWords:(NSString*)textString{
    
    NSMutableDictionary *words = [[NSMutableDictionary alloc] init];
    [textString enumerateSubstringsInRange:NSMakeRange(0, [textString length])
                          options:NSStringEnumerationByWords
                       usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                           NSLog(@"%@", substring);
                           if ([words objectForKey:substring]) {
                               NSNumber *count = [words objectForKey:substring];
                               int increment = (int)[count integerValue] + 1;
                               count = [NSNumber numberWithInt:increment];
                               [words setObject:count forKey:substring];
                               
                           }
                           else {
                               NSNumber *count = [NSNumber numberWithInt:1];
                               [words setObject:count forKey:substring];
                           }
                       }];
//    NSArray *sorted = [[words allValues] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        return [[words objectForKey:obj1] compare:[words objectForKey:obj2]];
//    }];
    
    NSArray *sorted = [self sortKeysByIntValue:words];
    
    int index = (int)[sorted count]-1;
    NSString *frequent = @"";
    
    for (int i = index; i >= 0; i--) {
        if ([[sorted objectAtIndex:i] isEqualToString:@"the"] || [[sorted objectAtIndex:i] isEqualToString:@"and"] || [[sorted objectAtIndex:i] isEqualToString:@"of"] || [[sorted objectAtIndex:i] isEqualToString:@"to"] || [[sorted objectAtIndex:i] isEqualToString:@"is"] || [[sorted objectAtIndex:i] isEqualToString:@"that"] || [[sorted objectAtIndex:i] isEqualToString:@"for"] || [[sorted objectAtIndex:i] isEqualToString:@"are"] || [[sorted objectAtIndex:i] isEqualToString:@"we"] || [[sorted objectAtIndex:i] isEqualToString:@"a"] || [[sorted objectAtIndex:i] isEqualToString:@"in"] || [[sorted objectAtIndex:i] isEqualToString:@"our"] || [[sorted objectAtIndex:i] isEqualToString:@"was"]) {
            //check for more common words
            continue;
        }
        else {
            frequent = [sorted objectAtIndex:i];
            break;
        }
    }
    
    NSLog(@"Frequent: %@", frequent);
    
    self.frequentword.text = frequent;
}


- (NSArray *)sortKeysByIntValue:(NSDictionary *)dictionary {
    
    NSArray *sortedKeys = [dictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        if (v1 < v2)
            return NSOrderedAscending;
        else if (v1 > v2)
            return NSOrderedDescending;
        else
            return NSOrderedSame;
    }];
    return sortedKeys;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
