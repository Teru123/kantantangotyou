//
//  EditCardTableViewController.m
//  SimpleFlashcardsJP
//
//  Created by Teru on 2014/12/11.
//  Copyright (c) 2014年 Self. All rights reserved.
//

#import "EditCardTableViewController.h"
#import "EnterCardnameTableViewController.h"

@interface EditCardTableViewController ()

@property (nonatomic, strong) NSString *titlenumberOfThis;

@end

@implementation EditCardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EnterCardnameTableViewController1"]) {
        EnterCardnameTableViewController *cardnameView = [segue destinationViewController];
        cardnameView.titleNumber = @"1";
    }else if ([[segue identifier] isEqualToString:@"EnterCardnameTableViewController2"]) {
        EnterCardnameTableViewController *cardnameView = [segue destinationViewController];
        cardnameView.titleNumber = @"2";
    }else if ([[segue identifier] isEqualToString:@"EnterCardnameTableViewController3"]) {
        EnterCardnameTableViewController *cardnameView = [segue destinationViewController];
        cardnameView.titleNumber = @"3";
    }else if ([[segue identifier] isEqualToString:@"EnterCardnameTableViewController4"]) {
        EnterCardnameTableViewController *cardnameView = [segue destinationViewController];
        cardnameView.titleNumber = @"4";
    }else if ([[segue identifier] isEqualToString:@"EnterCardnameTableViewController5"]) {
        EnterCardnameTableViewController *cardnameView = [segue destinationViewController];
        cardnameView.titleNumber = @"5";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Table view data source
//セルが選択された時の挙動を決定する。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.titlenumberOfThis = [NSString stringWithFormat:@"%ld", indexPath.row];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
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

@end
