//
//  ViewController.m
//  test
//
//  Created by xlp on 15/10/30.
//  Copyright © 2015年 realtech. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import <MagicalRecord/MagicalRecord.h>
#import "Person.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray arrayWithObjects:@"哈哈", @"嘻嘻", @"嗒嗒", @"呱呱", @"哇哇", nil];
    //[self newUserGuide];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    Person *person = [Person MR_createEntity];
    person.age = @24;
    person.firstname = @"linping";
    person.lastname = @"xiang";
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    NSArray *persons = [Person MR_findAll];
    NSLog(@"%@",persons);
    
}
- (void)newUserGuide {
    CGRect frame = [UIScreen mainScreen].bounds;
    _backgroundView = [[UIView alloc] initWithFrame:frame];
    _backgroundView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [[UIApplication sharedApplication].keyWindow addSubview:_backgroundView];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(frame) / 2, CGRectGetHeight(frame) / 2) radius:30 startAngle:0 endAngle:M_PI * 2 clockwise:NO]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    [_backgroundView.layer setMask:shapeLayer];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (sourceIndexPath != destinationIndexPath) {
        id object = _dataArray[sourceIndexPath.row];
        [_dataArray removeObjectAtIndex:sourceIndexPath.row];
        if (destinationIndexPath.row > _dataArray.count) {
            [_dataArray addObject:object];
        } else {
            [_dataArray insertObject:object atIndex:destinationIndexPath.row];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editAction:(id)sender {
    [_tableView setEditing:!_tableView.editing animated:YES];
}

@end
