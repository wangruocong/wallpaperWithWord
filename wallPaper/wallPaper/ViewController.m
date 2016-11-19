//
//  ViewController.m
//  wallPaper
//
//  Created by Roy on 2016/11/19.
//  Copyright © 2016年 wangruocong. All rights reserved.
//

#import "ViewController.h"
#import <PopMenu.h>
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self loadBottomButtonsForCount:4 andSetNames:@[@"设置背景",@"设置字体",@"字体大小",@"保存壁纸"]];
    
    

//    NSArray *firstItems = [self loadFirstMenuItems];
//    PopMenu *popMenu = [[PopMenu alloc] initWithFrame:self.view.bounds items:firstItems];
//    popMenu.menuAnimationType = kPopMenuAnimationTypeNetEase; // kPopMenuAnimationTypeSina
//    popMenu.perRowItemCount = 3; // or 2
//    [popMenu showMenuAtView:self.view];
}

- (void)loadBottomButtonsForCount:(int)count andSetNames:(NSArray*)names{
    for (int i = 0;  i<count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*SCREENWIDTH/count,SCREENHEIGHT-64, SCREENWIDTH/count, 64)];
        [btn setTitle:names[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor redColor]];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(bottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)bottomButtonClicked:(UIButton*)btn{
    switch (btn.tag) {
        case 100:{
            NSArray *firstItems = [self loadFirstMenuItems];
            PopMenu *popMenu = [[PopMenu alloc] initWithFrame:self.view.bounds items:firstItems];
            
            //自定义效果
            popMenu.menuAnimationType = 1; // kPopMenuAnimationTypeSina
            popMenu.perRowItemCount = 2; // or 2
            
            [popMenu showMenuAtView:self.view];
        }
            break;
        case 101:
            NSLog(@"设置字体");
            break;
        case 102:
            NSLog(@"字体大小");
            break;
        default:
            //第四个按钮
            NSLog(@"保存壁纸");
            break;
    }
}
- (NSArray*)loadFirstMenuItems{
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    MenuItem *menuItem = [[MenuItem alloc] initWithTitle:@"Flickr" iconName:@"post_type_bubble_flickr" glowColor:[UIColor grayColor] index:0];
    [items addObject:menuItem];
    
    menuItem = [[MenuItem alloc] initWithTitle:@"Googleplus" iconName:@"post_type_bubble_googleplus" glowColor:[UIColor colorWithRed:0.000 green:0.840 blue:0.000 alpha:1.000] index:0];
    [items addObject:menuItem];
    
    menuItem = [[MenuItem alloc] initWithTitle:@"Instagram" iconName:@"post_type_bubble_instagram" glowColor:[UIColor colorWithRed:0.687 green:0.000 blue:0.000 alpha:1.000] index:0];
    [items addObject:menuItem];
    
    menuItem = [[MenuItem alloc] initWithTitle:@"Twitter" iconName:@"post_type_bubble_twitter" glowColor:[UIColor colorWithRed:0.687 green:0.000 blue:0.000 alpha:1.000] index:0];
    [items addObject:menuItem];
    
    menuItem = [[MenuItem alloc] initWithTitle:@"Youtube" iconName:@"post_type_bubble_youtube" glowColor:[UIColor colorWithRed:0.687 green:0.000 blue:0.000 alpha:1.000] index:0];
    [items addObject:menuItem];
    
    menuItem = [[MenuItem alloc] initWithTitle:@"Facebook" iconName:@"post_type_bubble_facebook" glowColor:[UIColor colorWithRed:0.687 green:0.000 blue:0.000 alpha:1.000] index:0];
    [items addObject:menuItem];
    
    return items;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
