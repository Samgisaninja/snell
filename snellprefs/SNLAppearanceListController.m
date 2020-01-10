#include "SNLAppearanceListController.h"
#import <Cephei/HBPreferences.h>

@implementation SNLAppearanceListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Appearance" target:self];
	}
    HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
    NSDictionary *brainDict = [preferences objectForKey:@"brain"];
    NSLog(@"SNELL: %@", brainDict);
	return _specifiers;
}

-(void)testAlert{
    UIAlertController *testAlertController = [UIAlertController alertControllerWithTitle:@"Snell: This is a title" message:@"This is a message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *testDefaultAction = [UIAlertAction actionWithTitle:@"This is a \"default\" action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *testCancelAction = [UIAlertAction actionWithTitle:@"This is a \"cancel\" action" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *testDestructiveAction = [UIAlertAction actionWithTitle:@"This is a \"destructive\" action" style:UIAlertActionStyleDestructive handler:nil];
    [testAlertController addAction:testDefaultAction];
    [testAlertController addAction:testCancelAction];
    [testAlertController addAction:testDestructiveAction];
    [self presentViewController:testAlertController animated:TRUE completion:nil];
}

@end