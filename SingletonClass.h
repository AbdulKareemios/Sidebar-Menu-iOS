//
//  SingletonClass.h
//  SidebarMenu Sample
//
//  Created by Abdul Kareem on 1/13/15.
//  Copyright (c) 2015 MapletMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject
{
    
}
@property (assign)BOOL LangaugeArabic;
-(id)initWithInitialization;
-(void)loadTransitions :(id)controller :(BOOL)menuOpen;
@end
