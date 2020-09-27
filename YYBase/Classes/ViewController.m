//
//  ViewController.m
//  MasonryText
//
//  Created by NNU-SCENS on 2020/8/4.
//  Copyright © 2020 NNU-SCENS. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //声明区域，displatView是显示区域，keboardView是键盘区域
    UIView *disPlayView=[UIView new];
    [disPlayView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:disPlayView];
    
    UIView *keyBoardView=[UIView new];
    [self.view addSubview:keyBoardView];
    
    //先按1:3分割displayView和keyboardView
    [disPlayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(keyBoardView).multipliedBy(0.3f);
    }];
    
    [keyBoardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(disPlayView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.and.right.equalTo(self.view);
    }];
    
    //设置显示位置的数字为0
    UILabel *dispalyNum=[[UILabel alloc]init];
    [disPlayView addSubview:dispalyNum];
    dispalyNum.text=@"0";
    dispalyNum.font=[UIFont fontWithName:@"HeiTi SC" size:70];
    dispalyNum.textColor=[UIColor whiteColor];
    dispalyNum.textAlignment=NSTextAlignmentRight;
    [dispalyNum mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(disPlayView).with.offset(-10);
        make.bottom.equalTo(disPlayView).with.offset(-10);
    }];
    
    //定义键盘名称，？代表合并单元格
    NSArray *keys= @[@"AC",@"+/-",@"%",@"/"
                    ,@"7",@"8",@"9",@"*"
                    ,@"4",@"5",@"6",@"-"
                    ,@"1",@"2",@"3",@"+"
                    ,@"0",@"?",@".",@"="];
    
    int indexOfKeys = 0;
    for(NSString *key in keys) {
        indexOfKeys++;
        int rowNum = indexOfKeys%4 ==0? indexOfKeys/4:indexOfKeys/4+1;
        int colNUm = indexOfKeys%4 ==0? 4:indexOfKeys%4;
        NSLog(@"index is %d and row:%d, col:%d",indexOfKeys,rowNum,colNUm);
        
        UIButton *keyView=[UIButton buttonWithType:UIButtonTypeCustom];
        [keyBoardView addSubview:keyView];
        [keyView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [keyView setTitle:key forState:UIControlStateNormal];
        [keyView.layer setBorderWidth: 1];
        [keyView.layer setBorderColor:[[UIColor blackColor]CGColor]];
        [keyView.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30]];
         
        //约束
        [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
            //处理0 - 合并单元格
            if([key isEqualToString:@"0"] || [key isEqualToString:@"?"]) {
                if([key isEqualToString:@"0"]) {
                [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(keyBoardView.mas_height).with.multipliedBy(.2f);
                    make.width.equalTo(keyBoardView.mas_width).multipliedBy(.5f);
                    make.left.equalTo(keyBoardView.mas_left);
                    make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(.9f);
                }];
                }
                if([key isEqualToString:@"?"]) {
                    [keyView removeFromSuperview];
                }
            }
            //正常的单元格
            else {
                make.width.equalTo(keyBoardView.mas_width).with.multipliedBy(.25f);
                make.height.equalTo(keyBoardView.mas_height).with.multipliedBy(.2f);
                
                //按照行和列添加约束
                switch (rowNum) {
                    case 1:
                    {
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(.1f);
                        keyView.backgroundColor=[UIColor colorWithRed:205 green:205 blue:205 alpha:1];
                    }
                      break;
                    case 2:
                    {
                        make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(.3f);
                    }
                        break;
                    case 3:
                        {
                            make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(.5f);
                        }
                        break;
                    case 4:
                        {
                            make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(.7f);
                        }
                        break;
                    case 5:
                        {
                            make.baseline.equalTo(keyBoardView.mas_baseline).with.multipliedBy(.9f);
                        }
                        break;
                    default:
                        break;
                }
                switch (colNUm) {
                    case 1:
                    {
                        make.left.equalTo(keyBoardView.mas_left);
                    }
                      break;
                    case 2:
                    {
                        make.right.equalTo(keyBoardView.mas_centerX);
                    }
                        break;
                    case 3:
                        {
                            make.left.equalTo(keyBoardView.mas_centerX);
                        }
                        break;
                    case 4:
                        {
                            make.right.equalTo(keyBoardView.mas_right);
                            [keyView setBackgroundColor:[UIColor colorWithDisplayP3Red:243 green:127 blue:38 alpha:1]];
                        }
                        break;
                    default:
                        break;
                }
            }
        }];
    }
}


@end
