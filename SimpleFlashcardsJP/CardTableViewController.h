//
//  CardTableViewController.h
//  SimpleFlashcardsJP
//
//  Created by Teru on 2014/12/10.
//  Copyright (c) 2014年 Self. All rights reserved.
//

@import GoogleMobileAds;

#import <UIKit/UIKit.h>
#import "ChangeFilenameTableViewController.h"
#import "ChangeFoldernameTableViewController.h"
#import "CardListTableViewController.h"

@protocol CardTableViewControllerDelegate

-(void)editingFileInfoWasFinished;
-(void)editingFolderInfoWasFinished;
-(void)reloadTheCard;

@end

@interface CardTableViewController : UITableViewController <ChangeFilenameTableViewControllerDelegate, ChangeFoldernameTableViewControllerDelegate, CardListTableViewControllerDelegate>

@property (nonatomic, strong) id<CardTableViewControllerDelegate> cardTableViewDelegate;

@property (nonatomic, assign) NSInteger folderID;
@property (nonatomic, assign) NSInteger fileID;
@property (nonatomic, strong) NSString *foldernameData;
@property (nonatomic, strong) NSString *filenameData;
@property (nonatomic, strong) NSString *fixedFilename;
@property (nonatomic, strong) NSString *fixedFoldername;

@property (weak, nonatomic) IBOutlet UILabel *filenameLabel;
@property (weak, nonatomic) IBOutlet UILabel *foldernameLabel;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView6Plus;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView6;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerViewFour;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end
