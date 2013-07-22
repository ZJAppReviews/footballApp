//
//  LeftMenuViewController.m
//  FootBallApps
//
//  Created by Angus on 13-7-8.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "MMSideDrawerTableViewCell.h"
#import "MainViewController.h"
#import "WebViewController.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

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
	// Do any additional setup after loading the view.
    UITableView* atableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = atableView;
    
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    
    //供Demo展示
    [self.tableView setSeparatorColor:[UIColor colorWithRed:49.0/255.0
                                                      green:54.0/255.0
                                                       blue:57.0/255.0
                                                      alpha:1.0]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:77.0/255.0
                                                       green:79.0/255.0
                                                        blue:80.0/255.0
                                                       alpha:1.0]];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:66.0/255.0
                                                  green:69.0/255.0
                                                   blue:71.0/255.0
                                                  alpha:1.0]];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [self.mm_drawerController setShowsShadow:YES];
    
    
}
//恒大新闻:新闻内页;
//赛事信息:足球射手榜;
//俱乐部:简介 历史 主场 比赛服  吉祥物 战绩 大事记 奖杯 转会;
//会员专区:会员卡介绍 积分查询 观赛年票 会员积分 羊城通 手机卡 公告 常见问题;
//手机订票
//商务
//网上商城
//球迷论坛;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[MMSideDrawerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:@"广州恒大"];
            break;
        case 1:
            [cell.textLabel setText:@"恒大新闻"];
            break;
        case 2:
            [cell.textLabel setText:@"赛事信息"];
            break;
        case 3:
            [cell.textLabel setText:@"俱乐部"];
            break;
        case 4:
            [cell.textLabel setText:@"会员专区"];
            break;
        case 5:
            [cell.textLabel setText:@"手机订票"];
            break;
        case 6:
            [cell.textLabel setText:@"商务"];
            break;
        case 7:
            [cell.textLabel setText:@"网上商城"];
            break;
        case 8:
            [cell.textLabel setText:@"球迷论坛"];
        default:
            
            break;
    }
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 9;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@" did Select %d",indexPath.row);
        UINavigationController * nav = nil;
    if(indexPath.row < 8){
        MainViewController* center = [[MainViewController alloc]initWithStyle:UITableViewStyleGrouped];

         nav = [[UINavigationController alloc] initWithRootViewController:center];
    }else if(indexPath.row == 8){
        
        WebViewController* web = [[WebViewController alloc]initWithURLString:@"http://www.baidu.com"] ;
         nav = [[UINavigationController alloc] initWithRootViewController:web];
    }else if(indexPath.row == 7){
        WebViewController* web = [[WebViewController alloc]initWithURLString:@"http://www.google.com"];
        nav = [[UINavigationController alloc] initWithRootViewController:web];
    }else if(indexPath.row == 6){
        WebViewController* web = [[WebViewController alloc]initWithURLString:@"http://www.163.com"];
        nav = [[UINavigationController alloc] initWithRootViewController:web];
    }
     
    [self.mm_drawerController setCenterViewController:nav withFullCloseAnimation:NO
         completion:nil];
    

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.tableView.numberOfSections-1)] withRowAnimation:UITableViewRowAnimationNone];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
