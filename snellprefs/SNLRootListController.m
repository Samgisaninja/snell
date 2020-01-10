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

@end
