//
//  modalViewController.m
//  anotherModalViewOrientation
//
//  Created by Andrey Derevyagin on 4/27/13.
//  Copyright (c) 2013 derand. All rights reserved.
//

#import "modalViewController.h"

@interface modalViewController ()

@end

@implementation modalViewController
@synthesize delegate;


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

	self.view.backgroundColor = [UIColor greenColor];
	
	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapWebView:)];
	singleTap.numberOfTapsRequired = 1;
	singleTap.delegate = self;
	[self.view addGestureRecognizer:singleTap];
	[singleTap release];
	
	self.navigationItem.title = NSLocalizedString(@"Modal View", nil);
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done", nil)
																   style:UIBarButtonItemStyleDone
																  target:self action:@selector(backBarButtonItemAction:)];
	self.navigationItem.leftBarButtonItem = doneButton;
	[doneButton release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark rotation iSO 5.x

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight); //||  (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

#pragma mark rotation iOS 6.x

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return UIInterfaceOrientationLandscapeRight;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}

#pragma mark tap

- (void)singleTapWebView:(UITapGestureRecognizer *)gesture
{
	[self backBarButtonItemAction:nil];
}

#pragma mark -

- (void)backBarButtonItemAction:(id)sender
{
	if (delegate)
	{
		[delegate modalViewControllerDismiss:self];
	}
}



@end
