//
//  ViewController.m
//  day07-实验
//
//  Created by 1 on 15/10/5.
//  Copyright © 2015年 sit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray * fontsMutableArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fontsArray];
    NSLog(@"字体种类：%ld",self.fontsMutableArray.count);

}
#pragma mark-UITableViewDataSource && UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.fontsMutableArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSString * str = [NSString stringWithFormat:@"helloWorld你好世界-%ld",indexPath.row];
    //设置textLabel的文本的字体
    cell.textLabel.attributedText = [[NSAttributedString alloc]initWithString:str attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:self.fontsMutableArray[indexPath.row] size:15],NSFontAttributeName,[UIColor redColor],NSForegroundColorAttributeName, nil]];
    cell.detailTextLabel.text = self.fontsMutableArray[indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10 weight:0.5];

    return cell;
}

//得到所有字体名字的数组
-(void)fontsArray{
    self.fontsMutableArray = [NSMutableArray array];
    NSArray * familyNamesArray = [NSArray arrayWithArray:[UIFont familyNames]];
    for (NSString * familyName in familyNamesArray) {
        NSArray * fontNamesArray = [NSArray arrayWithArray:[UIFont fontNamesForFamilyName:familyName]];
        if (fontNamesArray.count == 0) {
            [self.fontsMutableArray addObject:familyName];
        }else {
            for (NSString * fontName in fontNamesArray) {
                [self.fontsMutableArray addObject:fontName];
            }
        }
    }
}



/*
//感叹号
//    cell.accessoryType = UITableViewCellAccessoryDetailButton;
//右尖角
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//感叹号+右尖角
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//对勾
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
