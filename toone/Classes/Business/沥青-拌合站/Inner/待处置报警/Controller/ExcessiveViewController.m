//
//  ExcessiveViewController.m
//  toone
//
//  Created by shtoone on 16/12/20.
//  Copyright © 2016年 shtoone. All rights reserved.
//

#import "ExcessiveViewController.h"
#import "XFSegementView.h"
#import "PrimaryExcessiveTableConller.h"
#import "MiddleExcessiveTableContller.h"
#import "SeniorExcessiveTableConller.h"
#import "TotalTableController.h"

@interface ExcessiveViewController ()<TouchLabelDelegate>

@property (nonatomic, strong) XFSegementView *segementView;
@property (nonatomic, strong) UITableViewController *tableCont;

@end
@implementation ExcessiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    初始化分页
    self.tableCont = [[PrimaryExcessiveTableConller alloc] init];
    if ([self.tableCont isKindOfClass:[PrimaryExcessiveTableConller class]]) {
        
        [self addChildViewController:self.tableCont];
        [self.view addSubview:self.tableCont.view];
        
    }
    
    [self setSegement];
}

-(void)setSegement {
    self.segementView = [[XFSegementView alloc]initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 35)];
    self.segementView.backgroundColor = [UIColor snowColor];
    
    self.segementView.titleArray = @[@"初级",@"中级",@"高级",@"总"];
    
    self.segementView.touchDelegate = self;
    
    [self.view addSubview:self.segementView];
    
}

- (void)touchLabelWithIndex:(NSInteger)index {
    if (index == 0) { //初级
        [self.tableCont removeFromParentViewController];
        [self.tableCont.view removeFromSuperview];
        
        self.tableCont = [[PrimaryExcessiveTableConller alloc] init];
        
        PrimaryExcessiveTableConller *primaryVc =(PrimaryExcessiveTableConller *) self.tableCont;
        
        [self addChildViewController:primaryVc];
        [self.view addSubview:primaryVc.view];
        [self.view addSubview:self.segementView];
        

    }else if (index == 1) { //中级
        [self.tableCont removeFromParentViewController];
        [self.tableCont.view removeFromSuperview];
        
        self.tableCont = [[MiddleExcessiveTableContller alloc] init];
        
        MiddleExcessiveTableContller *middleVc =(MiddleExcessiveTableContller *) self.tableCont;
        
        [self addChildViewController:middleVc];
        [self.view addSubview:middleVc.view];
        [self.view addSubview:self.segementView];
        
    }else if (index == 2) { //高级
        [self.tableCont removeFromParentViewController];
        [self.tableCont.view removeFromSuperview];
        
        self.tableCont = [[SeniorExcessiveTableConller alloc] init];
        
        SeniorExcessiveTableConller *seniorVc =(SeniorExcessiveTableConller *) self.tableCont;
        
        [self addChildViewController:seniorVc];
        [self.view addSubview:seniorVc.view];
        [self.view addSubview:self.segementView];
        
    }else if (index == 3) { //总
        [self.tableCont removeFromParentViewController];
        [self.tableCont.view removeFromSuperview];
        
        self.tableCont = [[TotalTableController alloc] init];
        
        TotalTableController *totalVc =(TotalTableController *) self.tableCont;
        
        [self addChildViewController:totalVc];
        [self.view addSubview:totalVc.view];
        [self.view addSubview:self.segementView];
        
    }
    
}


@end
