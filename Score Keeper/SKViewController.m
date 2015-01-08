//
//  SKViewController.m
//  Score Keeper
//
//  Created by Kevin Lambert on 1/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKViewController.h"

@interface SKViewController () <UITextFieldDelegate>

//@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *scoreLabels;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Score Keeper";
    
    self.scoreLabels = [[NSMutableArray alloc] init];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.scrollView];
    
    for (NSInteger i = 0; i < 4; i++) {
        [self addScoreView:i];
    }
    
    
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, 200, 30)];
//    self.label.text = @"Change Me";
//    [self.view addSubview:self.label];
//    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 150, 200, 30)];
//    textField.placeholder = @"Enter Text Here";
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    [self.view addSubview:textField];
//    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 200, 200, 30)];
//    [button setTitle:@"Press!" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIButton *buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(15, 250, 200, 30)];
//    [buttonTwo setTitle:@"Press 2nd" forState:UIControlStateNormal];
//    [buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.view addSubview:buttonTwo];
//    [buttonTwo addTarget:self action:@selector(buttonTwoPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addScoreView:(NSInteger)index {
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, index * 90, self.view.frame.size.width, 90)];
    newView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:newView];
    
    UITextField *newName = [[UITextField alloc] initWithFrame:CGRectMake(20, 28, 120, 35)];
    [newView addSubview:newName];
    newName.placeholder = @"Enter Name";
    newName.delegate = self;
    newName.textColor = [UIColor blueColor];
    newName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *newScore = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 60, 50)];
    [newView addSubview:newScore];
    newScore.text = @"0";
    newScore.textAlignment = NSTextAlignmentCenter;
    newScore.textColor = [UIColor blueColor];
    [self.scoreLabels addObject:newScore];
    
    UIStepper *newStepper = [[UIStepper alloc] initWithFrame:CGRectMake(200, 30, 90, 50)];
    [newView addSubview:newStepper];
    newStepper.minimumValue = -99;
    newStepper.maximumValue = 99;
    newStepper.tag = index;
    newStepper.tintColor = [UIColor blueColor];
    [newStepper addTarget:self action:@selector(newStepperChanged:) forControlEvents:UIControlEventValueChanged];//Need Help on this
}

- (void)newStepperChanged:(id)sender {
    
    UIStepper *stepper = sender;
    NSInteger index = stepper.tag;
    double value = [stepper value];
    
    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat:@"%d", (int)value];
}//Need Help on this

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}//Need Help With This

//- (void)buttonPressed {
//    self.view.backgroundColor = [UIColor redColor];
//    self.label.text = @"Changed";
//    
//}

//- (void)buttonTwoPressed {
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.label.text = @"Change Me";
//}

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
