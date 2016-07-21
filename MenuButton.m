//
//  MenuButton.m
//  SweetButtonMenu
//
//  Created by Mohamed Ayadi on 6/6/16.
//  Copyright © 2016 Mohamed Ayadi. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton
NSString * const kHasFannedOnce =@"HasFannedOnce";

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    
    self.layer.cornerRadius= self.bounds.size.width/2;
    
    self.layer.borderWidth=2.0;
    if([[NSUserDefaults standardUserDefaults]boolForKey:kHasFannedOnce]){
        
        
        self.layer.borderColor= [UIColor redColor].CGColor;
        self.layer.backgroundColor=[UIColor greenColor].CGColor;
        
    }else{
        
        self.layer.borderColor= [UIColor purpleColor].CGColor;
        self.layer.backgroundColor=[UIColor blueColor].CGColor;
        
    }
   
    
    
    return self;
    
    
    
}

-(void)setButtonTitle:(NSString *)buttonTitle{
    _buttonTitle=buttonTitle;
    [self setTitle:buttonTitle forState:UIControlStateNormal];
    NSLog(@"_buttonTitle %@  self.buttonTitle %@",_buttonTitle, self.buttonTitle);
}

@end
