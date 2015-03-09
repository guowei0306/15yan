//
//  MenuViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "MHTabBarController.h"

@interface LeftMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,MHTabBarControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;

@end
