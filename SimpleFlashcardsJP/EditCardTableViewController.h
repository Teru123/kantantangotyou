//
//  EditCardTableViewController.h
//  SimpleFlashcardsJP
//
//  Created by Teru on 2014/12/11.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnterCardnameTableViewController.h"

@protocol EditCardTableViewControllerDelegate

-(void)cardEditingInfoWasFinished;

@end

@interface EditCardTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, EnterCardnameTableViewControllerDelegate>

@property (nonatomic, strong) id<EditCardTableViewControllerDelegate> editCardDelegate;
@property (nonatomic, strong) NSString *filenameData;
@property (nonatomic) int recordIDToEdit;
@property (weak, nonatomic) IBOutlet UILabel *textOne;
@property (weak, nonatomic) IBOutlet UILabel *textTwo;
@property (weak, nonatomic) IBOutlet UILabel *textThree;
@property (weak, nonatomic) IBOutlet UILabel *textFour;
@property (weak, nonatomic) IBOutlet UILabel *textFive;

@end