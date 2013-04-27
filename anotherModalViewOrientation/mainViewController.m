//
//  mainViewController.m
//  anotherModalViewOrientation
//
//  Created by Andrey Derevyagin on 4/27/13.
//  Copyright (c) 2013 derand. All rights reserved.
//

#import "mainViewController.h"
#import "modalViewController.h"


@interface mainViewController ()

@end



@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		modalView = nil;
    }
    return self;
}

- (void)dealloc
{
	[modalView release];
	modalView = nil;
	
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor yellowColor];
	
	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapWebView:)];
	singleTap.numberOfTapsRequired = 1;
	singleTap.delegate = self;
	[self.view addGestureRecognizer:singleTap];
	[singleTap release];
	
	UILabel *lbl = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
	lbl.backgroundColor = [UIColor clearColor];
	lbl.opaque = NO;
	lbl.textColor = [UIColor redColor];
	lbl.font = [UIFont systemFontOfSize:24.0];
	lbl.textAlignment = UITextAlignmentCenter;
	lbl.text = NSLocalizedString(@"Touch me", nil);
	[self.view addSubview:lbl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}

#pragma mark tap

- (void)singleTapWebView:(UITapGestureRecognizer *)gesture
{
	if (!modalView)
	{
		modalView = [[modalViewController alloc] init];
		modalView.delegate = self;
	}
	
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:modalView];
	navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	[self presentModalViewController:navController animated:YES];
	[navController release];
	
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
}

#pragma mark modalViewControllerDelagate

- (void)modalViewControllerDismiss:(modalViewController *)sender
{
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
	
	[self dismissModalViewControllerAnimated:YES];
}


@end
