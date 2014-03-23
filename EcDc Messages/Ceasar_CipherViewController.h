//
//  Ceasar_CipherViewController.h
//  EcDc Messages
//
//  Created by Shubham Sorte on 20/03/14.
//  Copyright (c) 2014 Apps2Eaze. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Ceasar_CipherModel.h"

@interface Ceasar_CipherViewController : UIViewController <UITextFieldDelegate>

@property (retain) Ceasar_CipherModel *model;
@property (retain) IBOutlet UISlider *slider;
@property (retain) IBOutlet UITextField *originalText;
@property (retain) IBOutlet UITextField *codedText;
@property (retain) IBOutlet UILabel *cipherLabel;
-(IBAction)ReturnKeyButton:(id)sender;
-(IBAction)sliderMoved;
-(IBAction)originalChanged;
-(IBAction)codedChanged;
-(IBAction)update;

@end
