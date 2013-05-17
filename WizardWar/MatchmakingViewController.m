//
//  MatchmakingViewController.m
//  WizardWar
//
//  Created by Sean Hess on 5/17/13.
//  Copyright (c) 2013 The LAB. All rights reserved.
//

#import "MatchmakingViewController.h"
#import "IntroLayer.h"
#import "WWDirector.h"
#import "CCScene+Layers.h"
#import "MatchLayer.h"
#import "MatchmakingTableViewController.h"

@interface MatchmakingViewController ()

@end

@implementation MatchmakingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView {
    [super loadView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"Matchmaking";
    self.view.backgroundColor = [UIColor redColor];
    MatchmakingTableViewController *matchesTableViewController = [[MatchmakingTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.view addSubview:matchesTableViewController.view];
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // hide the navigation bar first, so the size of this view is correct!
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    CCDirectorIOS * director = [WWDirector directorWithBounds:self.view.bounds];
    [director runWithScene:[CCScene sceneWithLayer:[MatchLayer node]]];
    [self.navigationController pushViewController:director animated:YES];
}

@end
