//
//  modalViewController.h
//  anotherModalViewOrientation
//
//  Created by Andrey Derevyagin on 4/27/13.
//  Copyright (c) 2013 derand. All rights reserved.
//

#import <UIKit/UIKit.h>

@class modalViewController;

@protocol modalViewControllerDelegate <NSObject>
- (void)modalViewControllerDismiss:(modalViewController *)sender;
@end


@interface modalViewController : UIViewController
{
	id<modalViewControllerDelegate> delagate;
}

@property(nonatomic, assign) id<modalViewControllerDelegate> delegate;

@end
