//
//  Ceasar_CipherViewController.m
//  EcDc Messages
//
//  Created by Shubham Sorte on 20/03/14.
//  Copyright (c) 2014 Apps2Eaze. All rights reserved.
//

#import "Ceasar_CipherViewController.h"
#import "Ceasar_CipherModel.h"
@interface Ceasar_CipherViewController ()

@end

@implementation Ceasar_CipherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _model = [[Ceasar_CipherModel alloc] init];
    _model.decodeMode = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)
                                   ];
    [self.view addGestureRecognizer:tap];
    
    

}

-(IBAction)dismissKeyboard
{
    [_originalText resignFirstResponder];
    [_codedText resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)sliderMoved{
	_model.cipherKey = (int)_slider.value;
	self.cipherLabel.text = [NSString stringWithFormat:@"Cipher Key: %d", _model.cipherKey];
    [self update];
}
-(IBAction)originalChanged{
    _model.decodeMode = NO;
    _model.originalMessage = _originalText.text;
    [self update];
}

-(IBAction)codedChanged{
	_model.decodeMode = YES;
	_model.codedMessage = _codedText.text;
	[self update];
}

-(IBAction)update{
	self.slider.value = _model.cipherKey;
	
	if (_model.decodeMode) {
		[_model decrypt];
		self.originalText.text = _model.originalMessage;
	}else {
		[_model encrypt];
		self.codedText.text = _model.codedMessage;
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
-(IBAction)ReturnKeyButton:(id)sender
{
    [self resignFirstResponder];
    
}

@end
