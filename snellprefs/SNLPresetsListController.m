#include "SNLPresetsListController.h"
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>

@implementation SNLPresetsListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Presets" target:self];
	}

	return _specifiers;
}

-(void)glyphPreset{
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
	[prefs setBool:TRUE forKey:@"isEnabled"];
	[prefs setObject:@"appBackground" forKey:@"useWallpaper"];
	[prefs setObject:@"unblurredStyle" forKey:@"blurStyle"];
	[prefs setBool:TRUE forKey:@"shouldChangeTitleColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customTitleColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeMessageColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customMessageColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeTopHalfColor"];
	[prefs setObject:@"FF000000" forKey:@"customTopHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeBottomHalfColor"];
	[prefs setObject:@"FF000000" forKey:@"customBottomHalfColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeActionHighlightColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customActionHighlightColor"];
	[prefs setBool:TRUE forKey:@"hideStockBackdrop"];
	[prefs setObject:@"customSeparators" forKey:@"separatorStyle"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customSeparatorColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeAlertActionTextColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customAlertActionTextColor"];
	[prefs setBool:TRUE forKey:@"shouldOverlayBackgroundColor"];
	[prefs setObject:@"FF000000" forKey:@"customBackgroundColor"];
	[prefs setBool:TRUE forKey:@"shouldUseBorder"];
	[prefs setObject:@"FFFFFFFF" forKey:@"borderColor"];
	[prefs synchronize];
	UIAlertController *testAlert = [UIAlertController alertControllerWithTitle:@"Preset saved" message:@"Your preset has been applied" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"This is a 'default' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"This is a 'cancel' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *destrutiveAction = [UIAlertAction actionWithTitle:@"This is a 'destructive' action" style:UIAlertActionStyleDefault handler:nil];
    [testAlert addAction:defaultAction];
    [testAlert addAction:cancelAction];
    [testAlert addAction:destrutiveAction];
    [self presentViewController:testAlert animated:TRUE completion:nil];
}

-(void)glassPanePreset{
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
	[prefs setBool:TRUE forKey:@"isEnabled"];
	[prefs setObject:@"homescreenBackground" forKey:@"useWallpaper"];
	[prefs setObject:@"lightStyle" forKey:@"blurStyle"];
	[prefs setBool:FALSE forKey:@"shouldChangeTitleColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customTitleColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeMessageColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customMessageColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeTopHalfColor"];
	[prefs setObject:@"88888888" forKey:@"customTopHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeBottomHalfColor"];
	[prefs setObject:@"88888888" forKey:@"customBottomHalfColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeActionHighlightColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customActionHighlightColor"];
	[prefs setBool:TRUE forKey:@"hideStockBackdrop"];
	[prefs setObject:@"hideSeparators" forKey:@"separatorStyle"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customSeparatorColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeAlertActionTextColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customAlertActionTextColor"];
	[prefs setBool:FALSE forKey:@"shouldOverlayBackgroundColor"];
	[prefs setObject:@"FF000000" forKey:@"customBackgroundColor"];
	[prefs setBool:FALSE forKey:@"shouldUseBorder"];
	[prefs setObject:@"FFFFFFFF" forKey:@"borderColor"];
	[prefs synchronize];
	UIAlertController *testAlert = [UIAlertController alertControllerWithTitle:@"Preset saved" message:@"Your preset has been applied" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"This is a 'default' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"This is a 'cancel' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *destrutiveAction = [UIAlertAction actionWithTitle:@"This is a 'destructive' action" style:UIAlertActionStyleDefault handler:nil];
    [testAlert addAction:defaultAction];
    [testAlert addAction:cancelAction];
    [testAlert addAction:destrutiveAction];
    [self presentViewController:testAlert animated:TRUE completion:nil];
}

-(void)electrifyingBluePreset{
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
	[prefs setBool:TRUE forKey:@"isEnabled"];
	[prefs setObject:@"homescreenBackground" forKey:@"useWallpaper"];
	[prefs setObject:@"darkStyle" forKey:@"blurStyle"];
	[prefs setBool:FALSE forKey:@"shouldChangeTitleColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customTitleColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeMessageColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customMessageColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeTopHalfColor"];
	[prefs setObject:@"FF00008B" forKey:@"customTopHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeBottomHalfColor"];
	[prefs setObject:@"FF00008B" forKey:@"customBottomHalfColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeActionHighlightColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customActionHighlightColor"];
	[prefs setBool:TRUE forKey:@"hideStockBackdrop"];
	[prefs setObject:@"customSeparators" forKey:@"separatorStyle"];
	[prefs setObject:@"FF77C3EC" forKey:@"customSeparatorColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeAlertActionTextColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customAlertActionTextColor"];
	[prefs setBool:FALSE forKey:@"shouldOverlayBackgroundColor"];
	[prefs setObject:@"FF000000" forKey:@"customBackgroundColor"];
	[prefs setBool:TRUE forKey:@"shouldUseBorder"];
	[prefs setObject:@"FF77C3EC" forKey:@"borderColor"];
	[prefs synchronize];
	UIAlertController *testAlert = [UIAlertController alertControllerWithTitle:@"Preset saved" message:@"Your preset has been applied" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"This is a 'default' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"This is a 'cancel' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *destrutiveAction = [UIAlertAction actionWithTitle:@"This is a 'destructive' action" style:UIAlertActionStyleDefault handler:nil];
    [testAlert addAction:defaultAction];
    [testAlert addAction:cancelAction];
    [testAlert addAction:destrutiveAction];
    [self presentViewController:testAlert animated:TRUE completion:nil];
}

-(void)forestPreset{
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
	[prefs setBool:TRUE forKey:@"isEnabled"];
	[prefs setObject:@"appBackground" forKey:@"useWallpaper"];
	[prefs setObject:@"unblurredStyle" forKey:@"blurStyle"];
	[prefs setBool:TRUE forKey:@"shouldChangeTitleColor"];
	[prefs setObject:@"FF00008B" forKey:@"customTitleColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeMessageColor"];
	[prefs setObject:@"FF00008B" forKey:@"customMessageColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeTopHalfColor"];
	[prefs setObject:@"FF90EE90" forKey:@"customTopHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeBottomHalfColor"];
	[prefs setObject:@"FF90EE90" forKey:@"customBottomHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeActionHighlightColor"];
	[prefs setObject:@"FF00008B" forKey:@"customActionHighlightColor"];
	[prefs setBool:TRUE forKey:@"hideStockBackdrop"];
	[prefs setObject:@"customSeparators" forKey:@"separatorStyle"];
	[prefs setObject:@"FF00008B" forKey:@"customSeparatorColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeAlertActionTextColor"];
	[prefs setObject:@"FF00008B" forKey:@"customAlertActionTextColor"];
	[prefs setBool:TRUE forKey:@"shouldOverlayBackgroundColor"];
	[prefs setObject:@"FF013220" forKey:@"customBackgroundColor"];
	[prefs setBool:TRUE forKey:@"shouldUseBorder"];
	[prefs setObject:@"FF013220" forKey:@"borderColor"];
	[prefs synchronize];
	UIAlertController *testAlert = [UIAlertController alertControllerWithTitle:@"Preset saved" message:@"Your preset has been applied" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"This is a 'default' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"This is a 'cancel' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *destrutiveAction = [UIAlertAction actionWithTitle:@"This is a 'destructive' action" style:UIAlertActionStyleDefault handler:nil];
    [testAlert addAction:defaultAction];
    [testAlert addAction:cancelAction];
    [testAlert addAction:destrutiveAction];
    [self presentViewController:testAlert animated:TRUE completion:nil];
}

-(void)whiteOutPreset{
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
	[prefs setBool:TRUE forKey:@"isEnabled"];
	[prefs setObject:@"appBackground" forKey:@"useWallpaper"];
	[prefs setObject:@"ultraLightStyle" forKey:@"blurStyle"];
	[prefs setBool:TRUE forKey:@"shouldChangeTitleColor"];
	[prefs setObject:@"FF000000" forKey:@"customTitleColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeMessageColor"];
	[prefs setObject:@"FF000000" forKey:@"customMessageColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeTopHalfColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customTopHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeBottomHalfColor"];
	[prefs setObject:@"FFFFFFFF" forKey:@"customBottomHalfColor"];
	[prefs setBool:FALSE forKey:@"shouldChangeActionHighlightColor"];
	[prefs setObject:@"FF00008B" forKey:@"customActionHighlightColor"];
	[prefs setBool:TRUE forKey:@"hideStockBackdrop"];
	[prefs setObject:@"customSeparators" forKey:@"separatorStyle"];
	[prefs setObject:@"FF000000" forKey:@"customSeparatorColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeAlertActionTextColor"];
	[prefs setObject:@"FF000000" forKey:@"customAlertActionTextColor"];
	[prefs setBool:FALSE forKey:@"shouldOverlayBackgroundColor"];
	[prefs setObject:@"FF013220" forKey:@"customBackgroundColor"];
	[prefs setBool:TRUE forKey:@"shouldUseBorder"];
	[prefs setObject:@"FF000000" forKey:@"borderColor"];
	[prefs synchronize];
	UIAlertController *testAlert = [UIAlertController alertControllerWithTitle:@"Preset saved" message:@"Your preset has been applied" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"This is a 'default' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"This is a 'cancel' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *destrutiveAction = [UIAlertAction actionWithTitle:@"This is a 'destructive' action" style:UIAlertActionStyleDefault handler:nil];
    [testAlert addAction:defaultAction];
    [testAlert addAction:cancelAction];
    [testAlert addAction:destrutiveAction];
    [self presentViewController:testAlert animated:TRUE completion:nil];
}

-(void)nightMoonPreset{
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
	[prefs setBool:TRUE forKey:@"isEnabled"];
	[prefs setObject:@"appBackground" forKey:@"useWallpaper"];
	[prefs setObject:@"darkBlurStyle" forKey:@"blurStyle"];
	[prefs setBool:TRUE forKey:@"shouldChangeTitleColor"];
	[prefs setObject:@"FFDAA520" forKey:@"customTitleColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeMessageColor"];
	[prefs setObject:@"FFDAA520" forKey:@"customMessageColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeTopHalfColor"];
	[prefs setObject:@"FF0A1172" forKey:@"customTopHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeBottomHalfColor"];
	[prefs setObject:@"FF0A1172" forKey:@"customBottomHalfColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeActionHighlightColor"];
	[prefs setObject:@"FFDAA520" forKey:@"customActionHighlightColor"];
	[prefs setBool:TRUE forKey:@"hideStockBackdrop"];
	[prefs setObject:@"customSeparators" forKey:@"separatorStyle"];
	[prefs setObject:@"FFDAA520" forKey:@"customSeparatorColor"];
	[prefs setBool:TRUE forKey:@"shouldChangeAlertActionTextColor"];
	[prefs setObject:@"FFDAA520" forKey:@"customAlertActionTextColor"];
	[prefs setBool:TRUE forKey:@"shouldOverlayBackgroundColor"];
	[prefs setObject:@"AA241571" forKey:@"customBackgroundColor"];
	[prefs setBool:TRUE forKey:@"shouldUseBorder"];
	[prefs setObject:@"FFDAA520" forKey:@"borderColor"];
	[prefs synchronize];
	UIAlertController *testAlert = [UIAlertController alertControllerWithTitle:@"Preset saved" message:@"Your preset has been applied" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"This is a 'default' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"This is a 'cancel' action" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *destrutiveAction = [UIAlertAction actionWithTitle:@"This is a 'destructive' action" style:UIAlertActionStyleDefault handler:nil];
    [testAlert addAction:defaultAction];
    [testAlert addAction:cancelAction];
    [testAlert addAction:destrutiveAction];
    [self presentViewController:testAlert animated:TRUE completion:nil];
}

@end
