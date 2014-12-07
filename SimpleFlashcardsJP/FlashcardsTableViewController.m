//
//  FlashcardsTableViewController.m
//  SimpleFlashcardsJP
//
//  Created by Teru on 2014/11/23.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "FlashcardsTableViewController.h"
#import "AddFileTableViewController.h"
#import "FolderDB.h"

@interface FlashcardsTableViewController ()

@property (nonatomic, strong) FolderDB *FolderManagerDB;
@property (nonatomic, strong) NSArray *folderInfoDB;
@property (nonatomic, strong) NSString *cellText;

-(void)loadData;

@end

@implementation FlashcardsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    //@selector()で指定メソッドをコール
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFolder:)];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    
    NSArray *actionButtonItems = @[editItem, addItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
    // Initialize the dbManager property.
    self.FolderManagerDB = [[FolderDB alloc] initWithDatabaseFilename:@"FolderDB.sql"];
    [self loadData];
}

-(void)addFolder: (UIBarButtonItem *)sender{
    CreateFolderTableViewController *createFolder =[[CreateFolderTableViewController alloc] init];
    createFolder.folderDelegate = self;
    
    [self performSegueWithIdentifier:@"CreateFolderTableViewController" sender:sender];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.cellText = cell.textLabel.text;
    return indexPath;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"CreateFolderTableViewController"]) {
        CreateFolderTableViewController *createFolder = [segue destinationViewController];
        createFolder.folderDelegate = self;
    }else if ([[segue identifier] isEqualToString:@"AddFileTableViewController"]){
        AddFileTableViewController *fileView = [segue destinationViewController];
        fileView.foldernameData = self.cellText;
        NSLog(@"%@", self.cellText);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.folderInfoDB.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FolderViewCell" forIndexPath:indexPath];
    
    NSInteger indexOfFoldername = [self.FolderManagerDB.arrColumnNames indexOfObject:@"foldername"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.folderInfoDB objectAtIndex:indexPath.row] objectAtIndex:indexOfFoldername]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", 0];

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)loadData{
    // Form the query.
    NSString *query = @"select * from folderInfo";
    
    // Get the results.
    if (self.folderInfoDB != nil) {
        self.folderInfoDB = nil;
    }
    
    self.folderInfoDB = [[NSArray alloc] initWithArray:[self.FolderManagerDB loadDataFromDB:query]];
    //NSLog(@"%ld", self.folderInfoDB.count);
    
    [self.tableView reloadData];
}

-(void)folderEditingInfoWasFinished{
    // Reload the data.
    NSLog(@"called editing");
    [self loadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
