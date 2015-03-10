//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "GWTopicViewController.h"
#import "HomeViewController.h"
#import "MHTabBarController.h"

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.contentSize = self.view.bounds.size;
    tableView.separatorColor = [UIColor lightGrayColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor colorWithRed:67 green:67 blue:67 alpha:0.3];
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.dataSource = self;
    tableView.delegate = self;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"leftStatus";
    //2.去缓存池中取可循环利用cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //3.如果缓存池中没有可循环利用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
        
    }
	switch (indexPath.row)
	{
		case 0:
			cell.textLabel.text = @"十五言";
			break;
    
		case 1:
			cell.textLabel.text = @"主题广场";
			break;
			
		case 2:
			cell.textLabel.text = @"搜索";
			break;
			
		case 3:
			cell.textLabel.text = @"微博登录";
			break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                        bundle: nil];
    
    GWTopicViewController *listViewController1 = [mainStoryboard instantiateViewControllerWithIdentifier: @"GWTopicViewController"];
    GWTopicViewController *listViewController2 =[mainStoryboard instantiateViewControllerWithIdentifier: @"GWTopicViewController"];
    
    listViewController1.title = @"热门";
    listViewController1.by_key = @"top";
    listViewController2.title = @"推荐";
    listViewController2.by_key = @"intro";
    
    NSArray *viewControllers = [NSArray arrayWithObjects:listViewController1, listViewController2, nil];
    MHTabBarController *tabBarController = [[MHTabBarController alloc] init];
    
    tabBarController.viewControllers = viewControllers;
 
	UIViewController *vc ;
	
	switch (indexPath.row)
	{
		case 0:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"HomeViewController"];
			break;
			
		case 1:
            tabBarController.delegate = self;
            tabBarController.title = @"主题广场";
            vc = tabBarController;
			break;
			
		case 2:
			vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"FriendsViewController"];
			break;
			
		case 3:
			[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
															 withSlideOutAnimation:self.slideOutAnimationEnabled
																	 andCompletion:nil];
}


@end
