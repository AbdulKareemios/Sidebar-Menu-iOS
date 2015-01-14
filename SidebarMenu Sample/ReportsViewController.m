//
//  ReportsViewController.m
//  SidebarMenu Sample
//
//  Created by Abdul Kareem on 1/13/15.
//  Copyright (c) 2015 MapletMobile. All rights reserved.
//

#import "ReportsViewController.h"

@interface ReportsViewController ()
{
    SingletonClass *objsingle;
}
@end

@implementation ReportsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    objsingle =[[SingletonClass alloc] initWithInitialization];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self loadTopBarView];
}
-(void)loadTopBarView
{
    TopBarViewController *objTopBar =[[TopBarViewController alloc]init];
    [objTopBar.view setFrame:CGRectMake(0, 10, objTopBar.view.frame.size.width, objTopBar.view.frame.size.height)];
    
    [self.view addSubview:objTopBar.view];
    [self addChildViewController:objTopBar];
    
    [objTopBar didMoveToParentViewController:self];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
