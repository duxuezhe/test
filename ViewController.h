//
//  ViewController.h
//  test
//
//  Created by duxuezhe on 17-4-10.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property(strong,nonatomic)NSMutableArray *persons;

@end
