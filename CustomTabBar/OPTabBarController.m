//
//  OPTabBarController.m
//  CustomTabBar
//
//  Created by Oleg on 24.03.2018.
//  Copyright © 2018 Oleg. All rights reserved.
//

#import "OPTabBarController.h"

@interface OPTabBarController ()

@end

@implementation OPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger count=[self.viewControllers count];

    for (NSInteger i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem* item = [self.tabBar.items objectAtIndex:i];
        [item setTag:i];
        NSLog(@"");
    }
    NSUInteger number=self.selectedIndex;
    NSLog(@"%zd", number);
    UIViewController* navController=[self.viewControllers objectAtIndex:0];
    NSLog(@"");

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.tabBar invalidateIntrinsicContentSize];
    self.tabBar.frame=CGRectMake(0, 50, self.tabBar.bounds.size.width, 50);
    self.tabBar.unselectedItemTintColor=[UIColor redColor];
    self.tabBar.barTintColor=[UIColor blackColor];


}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    UIImage* image=item.selectedImage;
    [self clearingTabBarFromStuff:tabBar];
    CGRect tbFrame=[self frameForTabInTabBar:tabBar withIndex:item.tag];
    
    [UIView animateWithDuration:0.3 animations:^{
        UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(tbFrame.origin.x, tbFrame.origin.y, tbFrame.size.width, tbFrame.size.height + 6)];
        button.backgroundColor=[UIColor redColor];
        [button setImage:image forState:UIControlStateNormal];
        button.layer.cornerRadius=10;
        button.layer.masksToBounds=YES;
        [tabBar addSubview:button];
    } completion:nil];
   
    NSLog(@"");
}

-(CGRect)frameForTabInTabBar:(UITabBar*)tabBar withIndex:(NSUInteger)index
{
    NSUInteger currentTabIndex = 0;
    
    for (UIView* subView in tabBar.subviews)
    {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            if (currentTabIndex == index)
                return subView.frame;
            else
                currentTabIndex++;
        }
    }
    
    NSAssert(NO, @"Index is out of bounds");
    return CGRectNull;
}

-(void)clearingTabBarFromStuff:(UITabBar*)tabBar{
    for (id subView in tabBar.subviews) {
        if([subView isKindOfClass:[UIView class]] && ![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [subView removeFromSuperview];
        }
    }
}

@end
