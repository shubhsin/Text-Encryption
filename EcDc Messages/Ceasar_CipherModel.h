//
//  Ceasar_CipherModel.h
//  EcDc Messages
//
//  Created by Shubham Sorte on 20/03/14.
//  Copyright (c) 2014 Apps2Eaze. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ceasar_CipherModel : NSObject
@property (retain) NSString *originalMessage;
@property (retain) NSString *codedMessage;
@property (assign) int cipherKey;
@property (assign) BOOL decodeMode;

-(void)encrypt;
-(void)decrypt;
-(id)initWithCipherKey:(int)key;
-(unichar) encryptChar:(unichar) character;
-(unichar) decryptChar:(unichar) character;
@end
