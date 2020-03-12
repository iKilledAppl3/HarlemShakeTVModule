#import <TVSystemMenuUI/TVSMModuleContentViewControllerDelegate.h>
#import <TVSystemMenuUI/TVSMModuleContentViewController.h>
#import <TVSystemMenuUI/TVSMActionModule.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>


/*

	This tweak/TVControlCenterModule was created out of boredom and for my good friend David from @thejailbreakhub.
	Copyright 2019 J.K. Hayslip (@iKilledAppl3) & ToxicAppl3 INSDC./iKilledAppl3 LLC.
	December, 29, 2019 was a fun day for us all!
	Anyways enjoy and remember not to spoil yourself!


*/


// Do the HARLEM SHAKE!
#import "VLMHarlemShake.h"

@interface HarlemShakeTVModule : TVSMActionModule {
    NSString *packageFile;
    TVSMButtonViewController *buttonController;
    UIImage *theImage;
    VLMHarlemShake *harlemShake;
    UIView *lonerView;
    BOOL animating;
    
}
+(long long)buttonStyle;
-(id)contentViewController;
-(void)handleAction;
-(BOOL)dismissAfterAction;
-(void)dealloc;
@end

@interface TVSMSystemMenuManager : NSObject
+(id)sharedInstance;
-(void)dismissSystemMenu;
@end
