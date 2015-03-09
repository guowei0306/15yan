//
//  RightMenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/26/14.
//  Copyright (c) 2014 Aryan Ghassemi. All rights reserved.
//

#import "RightMenuViewController.h"

@implementation RightMenuViewController

#pragma mark - UIViewController Methods -

- (void)viewDidLoad
{
	[super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.contentSize = self.view.bounds.size;
    
//	tableView.separatorColor = [UIColor lightGrayColor];
//	
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightMenu"]];
//	tableView.backgroundView = imageView;
// 
//	self.view.layer.borderWidth = .6;
//	self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor colorWithRed:67 green:67 blue:67 alpha:0.3];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    tableView = tableView;
    
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
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
    static NSString *ID = @"rightStatus";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
//    cell.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
	switch (indexPath.row)
	{
		case 0:
			cell.textLabel.text = @"设置字体";
			break;
			
		case 1:
			cell.textLabel.text = @"应用打分";
			break;
			
		case 2:
			cell.textLabel.text = @"选择主题";
			break;
			
		case 3:
			cell.textLabel.text = @"退出登录";
			break;
			
		case 4:
			cell.textLabel.text = @"问题反馈";
			break;
			
		case 5:
			cell.textLabel.text = @"关于我们";
			break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	id <SlideNavigationContorllerAnimator> revealAnimator;
	
	switch (indexPath.row)
	{
		case 0:
			revealAnimator = nil;
			break;
			
		case 1:
			revealAnimator = [[SlideNavigationContorllerAnimatorSlide alloc] init];
			break;
			
		case 2:
			revealAnimator = [[SlideNavigationContorllerAnimatorFade alloc] init];
			break;
			
		case 3:
			revealAnimator = [[SlideNavigationContorllerAnimatorSlideAndFade alloc] initWithMaximumFadeAlpha:.8 fadeColor:[UIColor blackColor] andSlideMovement:100];
			break;
			
		case 4:
			revealAnimator = [[SlideNavigationContorllerAnimatorScale alloc] init];
			break;
			
		case 5:
			revealAnimator = [[SlideNavigationContorllerAnimatorScaleAndFade alloc] initWithMaximumFadeAlpha:.6 fadeColor:[UIColor blackColor] andMinimumScale:.8];
			break;
			
		default:
			return;
	}
	
	[[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
		[SlideNavigationController sharedInstance].menuRevealAnimator = revealAnimator;
	}];
}

@end
