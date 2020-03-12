#import "HarlemShakeTVModule.h"

/*

	This tweak/TVControlCenterModule was created out of boredom and for my good friend David from @thejailbreakhub.
	Copyright 2019 J.K. Hayslip (@iKilledAppl3) & ToxicAppl3 INSDC./iKilledAppl3 LLC.
	December, 29, 2019 was a fun day for us all!
	Anyways enjoy and remember not to spoil yourself!


*/


@implementation HarlemShakeTVModule

+(long long)buttonStyle {
    return 1;
}

-(id)contentViewController {
    
    buttonController = (TVSMButtonViewController*)[super contentViewController];
    [buttonController setStyle:1];
    packageFile = [[self bundle] pathForResource:@"HarlemShake" ofType:@"png"];
    theImage = [[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [buttonController setImage:theImage];
    
    return buttonController;
    
}

-(void)handleAction {
	if (!animating) {
		lonerView = self.contentViewController.view;
	harlemShake = [[VLMHarlemShake alloc] initWithLonerView:lonerView];
	}

	if (animating) {
		return;
	}

	if (lonerView != nil) {
		animating = YES;
	}
	

	[harlemShake shakeWithCompletion:^{
    animating = NO;
    harlemShake = nil;

    // We call this so the control center can dismiss after the whole thing finishes animating
    TVSMSystemMenuManager *controlCenterMan = [NSClassFromString(@"TVSMSystemMenuManager") sharedInstance];
    [controlCenterMan dismissSystemMenu];

}];
    
}

//Since the VLMHarlemShake class can't use -fobjarc we have to release it manually :/ 
//We don't want memory leaks!
-(void)dealloc {
	[harlemShake release];
	[super dealloc];
}

// We return false here so it can be dismissed AFTER the animation has finished;
-(BOOL)dismissAfterAction {
    return FALSE;
}

@end
