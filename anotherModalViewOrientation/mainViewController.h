//
//  mainViewController.h
//  anotherModalViewOrientation
//
//  Created by Andrey Derevyagin on 4/27/13.
//  Copyright (c) 2013 derand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "modalViewController.h"


@interface mainViewController : UIViewController <UIGestureRecognizerDelegate, modalViewControllerDelegate>
{
	modalViewController *modalView;
}

@end
