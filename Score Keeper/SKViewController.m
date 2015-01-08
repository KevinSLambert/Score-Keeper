//
//  SKViewController.m
//  Score Keeper
//
//  Created by Kevin Lambert on 1/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, 200, 30)];
    self.label.text = @"Change Me";
    [self.view addSubview:self.label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 150, 200, 30)];
    textField.placeholder = @"Enter Text Here";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:textField];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 200, 30)];
    [button setTitle:@"Press!" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(15, 250, 200, 30)];
    [buttonTwo setTitle:@"Press 2nd" forState:UIControlStateNormal];
    [buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonTwo];
    [buttonTwo addTarget:self action:@selector(buttonTwoPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonPressed {
    self.view.backgroundColor = [UIColor redColor];
    self.label.text = @"Changed";
    
}

- (void)buttonTwoPressed {
    self.view.backgroundColor = [UIColor whiteColor];
    self.label.text = @"Change Me";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
