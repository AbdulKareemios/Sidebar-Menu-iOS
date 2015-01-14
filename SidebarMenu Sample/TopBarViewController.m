//
//  TopBarViewController.m
//  SidebarMenu Sample
//
//  Created by Abdul Kareem on 1/13/15.
//  Copyright (c) 2015 MapletMobile. All rights reserved.
//

#import "TopBarViewController.h"
#import "SideBarViewController.h"
@interface TopBarViewController ()
{
    id parentController;
    SingletonClass *objsingle;
    SideBarViewController *sideBar;
}
@end

@implementation TopBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithController :(id)controller
{
    self =[super init];
    parentController =controller;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    objsingle =[[SingletonClass alloc] initWithInitialization];

    
    [[self.view viewWithTag:99] removeFromSuperview];
    if(!objsingle.LangaugeArabic)
        [self.view addSubview:self.EnglishTop];
    else
        [self.view addSubview:self.arabicTop];
    
}
- (IBAction)langaugeChange:(UIButton *)sender
{
    if(!sender.selected)
    {
        [sender setSelected:YES];
        [[self.view viewWithTag:99] removeFromSuperview];
        
        [self.view addSubview:self.arabicTop];
        [self.arabicTop setFrame:CGRectMake(0, 0, _arabicTop.frame.size.width, _arabicTop.frame.size.height)];
        [(UIButton *)[self.view viewWithTag:88] setSelected:YES];
        
    }
    else
    {
        [sender setSelected:NO];
        [[self.view viewWithTag:99] removeFromSuperview];
        [self.view addSubview:self.EnglishTop];
        [self.arabicTop setFrame:CGRectMake(0, 0, _arabicTop.frame.size.width, _arabicTop.frame.size.height)];
        [(UIButton *)[self.view viewWithTag:88] setSelected:NO];
    }
    objsingle = [[SingletonClass alloc] initWithInitialization];
    objsingle.LangaugeArabic = sender.selected;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RELOAD_TABLE" object:nil];
}
-(IBAction)menuTap:(UIButton *)sender
{
    objsingle = [[SingletonClass alloc] initWithInitialization];
    [objsingle loadTransitions:self.parentViewController.navigationController :sender.selected];
    
    if(!sender.selected)
        [sender setSelected:YES];
    else
        [sender setSelected:NO];
    
    
    objsingle=nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
