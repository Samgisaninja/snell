#include "SNLRootListController.h"
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@implementation SNLRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)respring{
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=snell"]];
}

- (void)openGithub{
	NSDictionary *URLOptions = @{UIApplicationOpenURLOptionUniversalLinksOnly : @FALSE};
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.github.com/Samgisaninja/"] options:URLOptions completionHandler:nil];
}

- (void)openMyReddit{
	NSDictionary *URLOptions = @{UIApplicationOpenURLOptionUniversalLinksOnly : @FALSE};
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.reddit.com/u/Samg_is_a_Ninja"] options:URLOptions completionHandler:nil];
}

-(void)openMyTwitter{
	NSDictionary *URLOptions = @{UIApplicationOpenURLOptionUniversalLinksOnly : @FALSE};
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/Samg_is_a_Ninja"] options:URLOptions completionHandler:nil];
}

- (void)sendMail{
	NSDictionary *URLOptions = @{UIApplicationOpenURLOptionUniversalLinksOnly : @FALSE};
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:stgardner4@att.net"] options:URLOptions completionHandler:nil];
}

- (void)giveMeMoney{
	NSDictionary *URLOptions = @{UIApplicationOpenURLOptionUniversalLinksOnly : @FALSE};
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/SamGardner4"] options:URLOptions completionHandler:nil];
}

@end
