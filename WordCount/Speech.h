//
//  Speech.h
//  WordCount
//
//  Created by Vidya Murthy on 13/10/15.
//  Copyright © 2015 Vidya Murthy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Speech : NSObject

@property (nonatomic, strong) NSString *speaker;
@property (nonatomic, strong) NSString *speechDate;
@property (nonatomic, strong) NSString *speakerImage;
@property (nonatomic, strong) NSString *speechFileName;

@end
