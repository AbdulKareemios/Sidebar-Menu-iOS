//
//  SingletonClass.m
//  SidebarMenu Sample
//
//  Created by Abdul Kareem on 1/13/15.
//  Copyright (c) 2015 MapletMobile. All rights reserved.
//

#import "SingletonClass.h"

@implementation SingletonClass
@synthesize LangaugeArabic;
SingletonClass *objSelf;
-(id)initWithInitialization
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objSelf =[[SingletonClass alloc] init];
    });
    return objSelf;
}
-(void)loadTransitions :(id)controller :(BOOL)menuOpen
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.45;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.delegate = self;
    if(!LangaugeArabic)
    {
        if(!menuOpen)
        {
            [[controller view] setFrame:
             CGRectMake(280, 0, [controller view ].frame.size.width, [controller view ].frame.size.height)];
            transition.type = kCATransitionFromLeft;
            [transition setType:kCATransitionPush];
            transition.subtype = kCATransitionFromLeft;
            menuOpen=TRUE;
        }
        else
        {
            [[controller view ] setFrame:
             CGRectMake(0, 0, [controller view ].frame.size.width, [controller view ].frame.size.height)];
            transition.type = kCATransitionFromRight;
            [transition setType:kCATransitionPush];
            transition.subtype = kCATransitionFromRight;
            menuOpen =FALSE;
        }
    }
    else
    {
        if(!menuOpen)
        {
            [[controller view] setFrame:
             CGRectMake(-280, 0, [controller view ].frame.size.width, [controller view ].frame.size.height)];
            transition.type = kCATransitionFromRight;
            [transition setType:kCATransitionPush];
            transition.subtype = kCATransitionFromRight;
            menuOpen=TRUE;
        }
        else
        {
            [[controller view ] setFrame:
             CGRectMake(0, 0, [controller view ].frame.size.width, [controller view ].frame.size.height)];
            transition.type = kCATransitionFromLeft;
            [transition setType:kCATransitionPush];
            transition.subtype = kCATransitionFromLeft;
            menuOpen =FALSE;
        }
    }
    [[controller view ].layer addAnimation:transition forKey:nil];
    transition=nil;
    transition.delegate=nil;
}
@end
