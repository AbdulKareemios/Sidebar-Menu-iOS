//
//  TopBarViewController.h
//  SidebarMenu Sample
//
//  Created by Abdul Kareem on 1/13/15.
//  Copyright (c) 2015 MapletMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopBarViewController : UIViewController
@property (nonatomic,strong) IBOutlet UIView *arabicTop;
@property (nonatomic,strong) IBOutlet UIView *EnglishTop;
-(id)initWithController :(id)controller;
@end
