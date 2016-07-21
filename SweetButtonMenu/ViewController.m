//
//  ViewController.m
//  SweetButtonMenu
//
//  Created by Mohamed Ayadi on 6/6/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "ViewController.h"
#import "MenuButton.h"
@interface ViewController ()
@property MenuButton *mainButton;
@property NSArray *buttons;
@property UIDynamicAnimator*dynaicanimator;
@property CGFloat buttonSize;
@property BOOL isFanned;
@property BOOL checkedIfEverFanned;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonSize =50;
    
    self.buttons=@[[self createButtonWithTitle:@"1"],[self createButtonWithTitle:@"2"], [self createButtonWithTitle:@"3"]];
    
    self.mainButton = [self createButtonWithTitle:@"B"];
    
    [self.mainButton addTarget:self action:@selector(fanButtons) forControlEvents:UIControlEventTouchUpInside ];
    
    self.dynaicanimator =[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    self.isFanned =NO;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(MenuButton *)createButtonWithTitle:(NSString *)title{
    CGRect frame=self.view.frame;
    
    MenuButton *button=[[MenuButton alloc]initWithFrame:CGRectMake(0, frame.size.height - self.buttonSize, self.buttonSize, self.buttonSize)];
    button.buttonTitle=title;
    
    [self.view addSubview:button];
    
    
    
    
    return button;
    
}
-(void)fanButtons{
    
    [self.dynaicanimator removeAllBehaviors];
    
    if(self.isFanned){
       
        [self fanIn];}
        else{
            
            [self fanOut];
            [self checkedIfEverFanned];
            
        }
    self.isFanned = !self.isFanned;
    
}
-(void)fanIn{
    for(MenuButton *button in self.buttons){
        UISnapBehavior *snapBehavior =[[UISnapBehavior alloc]initWithItem:button snapToPoint:self.mainButton.center];
        [self.dynaicanimator addBehavior:snapBehavior];
    }
    
}
-(void)fanOut{
    for(int i=0;i<self.buttons.count;i++){
        MenuButton *button =self.buttons[i];
        CGPoint point=CGPointMake(self.view.frame.size.width-i *button.frame.size.width-self.buttonSize/2,self.view.frame.size.height-self.buttonSize/2 );
        UISnapBehavior *snapBehavior = [[UISnapBehavior alloc]initWithItem:button snapToPoint:point];
        [self.dynaicanimator addBehavior:snapBehavior];
    }
    
}
-(void)checkIFEverFanned{
    if(self.checkedIfEverFanned){
        return;
        
    }
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    NSLog(@"%i",[defaults boolForKey:kHasFannedOnce]);
    
    if(![defaults boolForKey:kHasFannedOnce]){
        [defaults setBool:YES forKey:kHasFannedOnce];
        [defaults synchronize];
        NSLog(@"%i",[defaults boolForKey:kHasFannedOnce]);
    }
    self.checkedIfEverFanned =YES;
    
}
@end
