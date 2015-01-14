//
//  SideBarViewController.m
//  SidebarMenu Sample
//
//  Created by Abdul Kareem on 1/13/15.
//  Copyright (c) 2015 MapletMobile. All rights reserved.
//

#import "SideBarViewController.h"
#import "AboutUsViewController.h"
#import "TentsViewController.h"
#import "ReportsViewController.h"
@interface SideBarViewController  ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *menuItems;
    NSArray *menuControllerNames;
    SingletonClass *objsingle;
    IBOutlet UITableView *listTable;
    UIViewController *sideBar;
}
@end

@implementation SideBarViewController
@synthesize listTable;
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
    
    menuItems =@[@"About Us",@"Camps",@"Reports",@"Maps",@"Trip",@"Bus Transportation"];
    menuControllerNames =@[@"AboutUsViewController",@"TentsViewController",@"ReportsViewController",@"GeographicViewController",@"AboutUsViewController",@"AboutUsViewController"];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTableView) name:@"RELOAD_TABLE" object:nil];
}
-(void)loadTableView
{
    [listTable reloadData];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
}
#pragma mark -
#pragma mark UITABLEVIEW DELEGATES

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    objsingle =[[SingletonClass alloc] initWithInitialization];
    NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //if(cell ==nil)
    {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.textLabel.text=[menuItems objectAtIndex:indexPath.row];

        if(objsingle.LangaugeArabic)
            [cell.textLabel setTextAlignment:NSTextAlignmentRight];
        else
            [cell.textLabel setTextAlignment:NSTextAlignmentLeft];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    sideBar =[[self.navigationController viewControllers] objectAtIndex:0];
    //Converting Class name from menuController array to controller object
    id controller = [[NSClassFromString([menuControllerNames objectAtIndex:indexPath.row]) alloc] init];
    for (id child in sideBar.childViewControllers)
    {
        @autoreleasepool {
            [[child view ]removeFromSuperview];
            [child removeFromParentViewController];
            [child willMoveToParentViewController:sideBar];
            [[child navigationController] removeFromParentViewController];
        }
    }

    UINavigationController *mainNavigation = [[UINavigationController alloc]initWithRootViewController:controller];
    
        [mainNavigation setNavigationBarHidden:YES];
        [mainNavigation addChildViewController:controller];
    
//**********Adding new navigation controller as child view controller***********//
        [sideBar addChildViewController:mainNavigation];
        [sideBar.view addSubview:[mainNavigation view]];
        [[mainNavigation view] setBackgroundColor:[UIColor whiteColor]];
        [mainNavigation didMoveToParentViewController:sideBar];
    
        //Animation of the Side menu bar
        objsingle =[[SingletonClass alloc] initWithInitialization];
        [objsingle loadTransitions:mainNavigation :TRUE];
        objsingle=nil;
        sideBar=nil;
        mainNavigation=nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
