#import <Cephei/HBPreferences.h>
#include <CSColorPicker/CSColorPicker.h>

extern "C" CFArrayRef CPBitmapCreateImagesFromData(CFDataRef cpbitmap, void*, int, void*);

BOOL enabled;
NSInteger themeMode;
NSString *useWallpaper;
NSString *blurStyle;
BOOL shouldChangeTitleColor;
NSString *titleColorHex;
BOOL shouldChangeMessageColor;
NSString *messageColorHex;
BOOL shouldChangeTopHalfColor;
NSString *customTopHalfColor;
BOOL shouldChangeBottomHalfColor;
NSString *customBottomHalfColor;
BOOL shouldChangeActionHighlightColor;
NSString *customActionHighlightColor;
UIView *highlightView;
BOOL hideStockBackdrop;
NSString *separatorStyle;
NSString *customSeparatorColor;
NSNumber *customSeparatorThickness;
BOOL shouldChangeAlertActionTextColor;
NSString *customAlertActionTextColor;
BOOL shouldOverlayBackgroundColor;
NSString *customBackgroundColor;
BOOL shouldUseBorder;
NSString *borderColor;
double borderCornerRadius;
double backdropCornerRadius;
BOOL hideCancelViewBackdrop;
BOOL useInHapticTouchMenus;
BOOL allowPresentHook;
NSString *airpodsBackgroundColor;
NSString *airpodsTitleColor;
NSString *airpodsMessageColor;
NSString *customAirpodsActionTextColor;
NSString *airpodsDefaultActionColor;
NSString *airpodsCancelActionColor;
NSString *airpodsDestructiveActionColor;

@interface _UIInterfaceActionGroupHeaderScrollView : UIView
@end

@interface UIAlertController ()
@property (readonly) UIView *_dimmingView;
@property UIView *_foregroundView;
-(void)_dismissWithAction:(UIAlertAction *)arg1;
@end

@interface _UIAlertControllerActionView : UIView
-(void)setBackgroundColor:(UIColor *)arg1;
-(UIAlertAction *)action;
-(UIAlertController *)alertController;
@end

@interface _UIInterfaceActionCustomViewRepresentationView : UIView
-(_UIAlertControllerActionView *)_actionContentView;
@end

@interface _UIInterfaceActionVibrantSeparatorView : UIView
-(id)_viewControllerForAncestor;
@end

@interface UIView ()
@end

@interface _UIDimmingKnockoutBackdropView : UIView
-(id)_viewControllerForAncestor;
@end

@interface SBFStaticWallpaperView : UIView
-(UIImage *)_displayedImage;
@end

@interface _UIAlertControlleriOSActionSheetCancelBackgroundView : UIView
@end

@interface UIAlertAction ()
@property (nonatomic, copy) id handler;
@end

#pragma mark AirPods style

@interface snellAirpodsViewController : UIViewController
@property (strong, nonatomic) UIAlertController *origAlertController;
@end

@implementation snellAirpodsViewController

-(void)viewDidLoad{
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(
		5,
		(screenRect.size.height - 325),
		(screenRect.size.width - 10),
		320
	)];
	[backgroundView setClipsToBounds:TRUE];
	[[backgroundView layer] setCornerRadius:30];
	[backgroundView setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsBackgroundColor]];
	[[self view] addSubview:backgroundView];
	UILabel *titleLabel = [[UILabel alloc] init];
	[titleLabel setText:[[self origAlertController] title]];
	[titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
	[titleLabel setNumberOfLines:0];
	[titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
	[titleLabel sizeToFit];
	[titleLabel setTextColor:[UIColor cscp_colorFromHexString:airpodsTitleColor]];
	float rollingHeight = (screenRect.size.height - 295);
	[titleLabel setFrame:CGRectMake(
		20,
		rollingHeight,
		(screenRect.size.width - 40),
		titleLabel.frame.size.height
	)];
	[[self view] addSubview:titleLabel];
	rollingHeight += titleLabel.frame.size.height;
	rollingHeight += 10;
	UILabel *messageLabel = [[UILabel alloc] init];
	[messageLabel setText:[[self origAlertController] message]];
	[messageLabel setFont:[UIFont systemFontOfSize:20]];
	[messageLabel setNumberOfLines:0];
	[messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
	[messageLabel setTextColor:[UIColor cscp_colorFromHexString:airpodsMessageColor]];
	[messageLabel setFrame:CGRectMake(
		20,
		rollingHeight,
		(screenRect.size.width - 40),
		9999
	)];
	[messageLabel sizeToFit];
	float buttonHeightLimit = rollingHeight + messageLabel.frame.size.height + 10;
	[[self view] addSubview:messageLabel];
	if ((int)[[[self origAlertController] actions] count] % 2) {
		rollingHeight = screenRect.size.height - 5;
		for (int a = ((int)[[[self origAlertController] actions] count] - 1); a >= 0; a--){
			rollingHeight -= 10;
			UIAlertAction *action = [[[self origAlertController] actions] objectAtIndex:a];
			UIButton *customActionButton = [UIButton buttonWithType:UIButtonTypeCustom];
			[customActionButton addTarget:self action:@selector(actionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
			[customActionButton setTitle:[action title] forState:UIControlStateNormal];
			rollingHeight -= 50;
			[customActionButton setFrame:CGRectMake(20, rollingHeight, (screenRect.size.width - 40), 50)];
			[customActionButton setClipsToBounds:TRUE];
			[[customActionButton layer] setCornerRadius:10];
			if ([action style] == UIAlertActionStyleDefault){
				[customActionButton setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsDefaultActionColor]];
			} else if ([action style] == UIAlertActionStyleCancel) {
				[customActionButton setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsCancelActionColor]];
			} else if ([action style] == UIAlertActionStyleDestructive) {
				[customActionButton setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsDestructiveActionColor]];
			}
			[customActionButton setTitleColor:[UIColor cscp_colorFromHexString:customAirpodsActionTextColor] forState:UIControlStateNormal];
			[[self view] addSubview:customActionButton];
		}
	} else {
		rollingHeight = screenRect.size.height - 5;
		for (int a = ((int)[[[self origAlertController] actions] count] - 1); a >= 0; a--){
			float rollingX;
			if (a % 2){
				rollingHeight -= 60;
				rollingX = ((screenRect.size.width)/2) + 10;
			} else {
				rollingX = 10;
			}
			UIAlertAction *action = [[[self origAlertController] actions] objectAtIndex:a];
			UIButton *customActionButton = [UIButton buttonWithType:UIButtonTypeCustom];
			[customActionButton addTarget:self action:@selector(actionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
			[customActionButton setTitle:[action title] forState:UIControlStateNormal];
			[customActionButton setFrame:CGRectMake(rollingX, rollingHeight, (screenRect.size.width/2 - 20), 50)];
			[customActionButton setClipsToBounds:TRUE];
			[[customActionButton layer] setCornerRadius:10];
			if ([action style] == UIAlertActionStyleDefault){
				[customActionButton setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsDefaultActionColor]];
			} else if ([action style] == UIAlertActionStyleCancel) {
				[customActionButton setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsCancelActionColor]];
			} else if ([action style] == UIAlertActionStyleDestructive) {
				[customActionButton setBackgroundColor:[UIColor cscp_colorFromHexString:airpodsDestructiveActionColor]];
			}
			[customActionButton setTitleColor:[UIColor cscp_colorFromHexString:customAirpodsActionTextColor] forState:UIControlStateNormal];
			[[self view] addSubview:customActionButton];
		}
	}
	if (rollingHeight < buttonHeightLimit){
			float correctionAmount = buttonHeightLimit - rollingHeight;
			[backgroundView setFrame:CGRectMake(
				backgroundView.frame.origin.x,
				(backgroundView.frame.origin.y - correctionAmount),
				backgroundView.frame.size.width,
				(backgroundView.frame.size.height + correctionAmount)
			)];
			[titleLabel setFrame:CGRectMake(
				titleLabel.frame.origin.x,
				(titleLabel.frame.origin.y - correctionAmount),
				titleLabel.frame.size.width,
				titleLabel.frame.size.height
			)];
			[messageLabel setFrame:CGRectMake(
				messageLabel.frame.origin.x,
				(messageLabel.frame.origin.y - correctionAmount),
				messageLabel.frame.size.width,
				messageLabel.frame.size.height
			)];
	}
}

-(void)actionButtonTouchUpInside:(UIButton *)sender{
	for (UIAlertAction *action in [[self origAlertController] actions]){
		if ([[action title] isEqualToString:[sender currentTitle]]){
			if (action.handler) {
				UIViewController *presentingViewController = [self presentingViewController];
				[self dismissViewControllerAnimated:TRUE completion:^{
					allowPresentHook = FALSE;
					[[[self origAlertController] view] setHidden:TRUE];
					[presentingViewController presentViewController:[self origAlertController] animated:FALSE completion:nil];
					allowPresentHook = TRUE;
					[[self origAlertController] _dismissWithAction:action];
				}];
			} else {
				[self dismissViewControllerAnimated:TRUE completion:nil];
			}
		}
	}
}

@end

#pragma mark tvOS style

@interface snellTvViewController : UIViewController
@property (strong, nonatomic) UIAlertController *origAlertController;
@end

@implementation snellTvViewController

-(void)viewDidLoad{
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular]];
	[blurView setFrame:screenRect];
	[[self view] addSubview:blurView];
	UILabel *titleLabel = [[UILabel alloc] init];
	[titleLabel setText:[[self origAlertController] title]];
	[titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
	[titleLabel setNumberOfLines:0];
	[titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
	[titleLabel sizeToFit];
	UILabel *messageLabel = [[UILabel alloc] init];
	[messageLabel setText:[[self origAlertController] message]];
	[messageLabel setFont:[UIFont systemFontOfSize:20]];
	[messageLabel setNumberOfLines:0];
	[messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
	[messageLabel sizeToFit];
	NSMutableArray *actionButtons = [[NSMutableArray alloc] init];
	for (int a = 0; a < [[[self origAlertController] actions] count]; a++){
		UIAlertAction *action = [[[self origAlertController] actions] objectAtIndex:a];
		UIButton *customActionButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[customActionButton addTarget:self action:@selector(makeMeGlow:) forControlEvents:UIControlEventTouchDown];
		[customActionButton addTarget:self action:@selector(makeMeGlow:) forControlEvents:UIControlEventTouchDragEnter];
		[customActionButton addTarget:self action:@selector(unglow:) forControlEvents:UIControlEventTouchDragExit];
		[customActionButton addTarget:self action:@selector(actionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
		[customActionButton setTitle:[action title] forState:UIControlStateNormal];
		[customActionButton sizeToFit];
		[customActionButton setFrame:CGRectMake(customActionButton.frame.origin.x, customActionButton.frame.origin.y, (screenRect.size.width - 30), customActionButton.frame.size.height)];
		[actionButtons addObject:customActionButton];
	}
	float totalHeight = titleLabel.frame.size.height + 10 + messageLabel.frame.size.height + ((int)[actionButtons count] * ([[actionButtons objectAtIndex:0] frame].size.height + 10));
	float rollingHeight = (screenRect.size.height/2) - (totalHeight/2);
	[titleLabel setFrame:CGRectMake(
		(((screenRect.size.width)/2) - (titleLabel.frame.size.width/2)),
		rollingHeight,
		titleLabel.frame.size.width,
		titleLabel.frame.size.height
	)];
	rollingHeight += titleLabel.frame.size.height;
	rollingHeight += 10;
	[[blurView contentView] addSubview:titleLabel];
	[messageLabel setFrame:CGRectMake(
		(((screenRect.size.width)/2) - (messageLabel.frame.size.width/2)),
		rollingHeight,
		messageLabel.frame.size.width,
		messageLabel.frame.size.height
	)];
	rollingHeight += messageLabel.frame.size.height;
	[[blurView contentView] addSubview:messageLabel];
	rollingHeight += 10;
	for (UIButton *customActionButton in actionButtons){
		rollingHeight += 10;
		UIView *buttonBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(
			(((screenRect.size.width)/2) - (customActionButton.frame.size.width/2)),
			rollingHeight,
			customActionButton.frame.size.width,
			customActionButton.frame.size.height
		)];
		[customActionButton setFrame:CGRectMake(
			0,
			0,
			customActionButton.frame.size.width,
			customActionButton.frame.size.height
		)];
		rollingHeight += customActionButton.frame.size.height;
		for (UIAlertAction *action in [[self origAlertController] actions]){
			if ([[action title] isEqualToString:[customActionButton currentTitle]]){
				if ([action style] == UIAlertActionStyleDefault){
					[buttonBackgroundView setBackgroundColor:[UIColor cscp_colorFromHexString:@"55555555"]];
				} else if ([action style] == UIAlertActionStyleCancel) {
					[buttonBackgroundView setBackgroundColor:[UIColor cscp_colorFromHexString:@"55555555"]];
				} else if ([action style] == UIAlertActionStyleDestructive) {
					[buttonBackgroundView setBackgroundColor:[UIColor cscp_colorFromHexString:@"55FF0000"]];
				}
			}
		}
		
		[buttonBackgroundView setClipsToBounds:TRUE];
		[[buttonBackgroundView layer] setCornerRadius:10];
		[[blurView contentView] addSubview:buttonBackgroundView];
		[buttonBackgroundView addSubview:customActionButton];
	}
}

-(void)makeMeGlow:(UIButton *)sender{
	CGRect preGlowFrame =  [[sender superview] frame];
	[UIView animateWithDuration:0.1 animations:^{
		[sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[[sender superview] setBackgroundColor:[UIColor whiteColor]];
		[sender setFrame:CGRectMake(
			sender.frame.origin.x + 5,
			sender.frame.origin.y + 5,
			sender.frame.size.width,
			sender.frame.size.height
		)];
		[[sender superview] setFrame:CGRectMake(
			(preGlowFrame.origin.x - 5),
			(preGlowFrame.origin.y - 5),
			(preGlowFrame.size.width + 10),
			(preGlowFrame.size.height + 10)
		)];
	}];
}

-(void)unglow:(UIButton *)sender{
	CGRect postGlowFrame = [[sender superview] frame];
	[UIView animateWithDuration:0.1 animations:^{
		[sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[[sender superview] setBackgroundColor:[UIColor cscp_colorFromHexString:@"55555555"]];
		[sender setFrame:CGRectMake(
			sender.frame.origin.x - 5,
			sender.frame.origin.y - 5,
			sender.frame.size.width,
			sender.frame.size.height
		)];
		[[sender superview] setFrame:CGRectMake(
			(postGlowFrame.origin.x + 5),
			(postGlowFrame.origin.y + 5),
			(postGlowFrame.size.width - 10),
			(postGlowFrame.size.height - 10)
		)];
	}];
}

-(void)actionButtonTouchUpInside:(UIButton *)sender{
	for (UIAlertAction *action in [[self origAlertController] actions]){
		if ([[action title] isEqualToString:[sender currentTitle]]){
			if (action.handler) {
				UIViewController *presentingViewController = [self presentingViewController];
				[self dismissViewControllerAnimated:TRUE completion:^{
					allowPresentHook = FALSE;
					[[[self origAlertController] view] setHidden:TRUE];
					[presentingViewController presentViewController:[self origAlertController] animated:FALSE completion:nil];
					allowPresentHook = TRUE;
					[[self origAlertController] _dismissWithAction:action];
				}];
			} else {
				[self dismissViewControllerAnimated:TRUE completion:nil];
			}
		}
	}
}

@end

%hook UIViewController

-(void)presentViewController:(id)arg1 animated:(BOOL)arg2 completion:(/*^block*/id)arg3{
	if (enabled && allowPresentHook) {
		if ([arg1 class] == [UIAlertController class]){
			if (themeMode == 1) {
				snellTvViewController *tvAlertController = [[snellTvViewController alloc] init];
				[tvAlertController setModalPresentationStyle:UIModalPresentationOverFullScreen];
				[tvAlertController setOrigAlertController:arg1];
				[tvAlertController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
				%orig(tvAlertController, TRUE, arg3);
			} else if (themeMode == 2){
				snellAirpodsViewController *connectAlertController = [[snellAirpodsViewController alloc] init];
				[connectAlertController setModalPresentationStyle:UIModalPresentationOverFullScreen];
				[connectAlertController setOrigAlertController:arg1];
				%orig(connectAlertController, TRUE, arg3);
			} else {
				%orig;
			}			
		} else {
			%orig;
		}
	} else {
		%orig;
	}
}

%end

#pragma mark Appearance


%hook UIAlertController

-(void)viewWillAppear:(BOOL)arg1{
    if (enabled && themeMode == 0) {
        UIVisualEffectView *snellEffectView;
        if ([blurStyle isEqualToString:@"ultraLightStyle"]) {
            snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
        } else if ([blurStyle isEqualToString:@"lightStyle"]) {
            snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        } else if ([blurStyle isEqualToString:@"regularStyle"]) {
            snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular]];
        } else if ([blurStyle isEqualToString:@"prominentStyle"]) {
            snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent]];
        } else if ([blurStyle isEqualToString:@"darkStyle"]) {
            snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        } else {
            snellEffectView = [[UIVisualEffectView alloc] init];
        }
        [snellEffectView setFrame:[[UIScreen mainScreen] bounds]];
        if ([useWallpaper isEqualToString:@"appBackground"]) {
            [self._dimmingView addSubview:snellEffectView];
        } else if ([useWallpaper isEqualToString:@"homescreenBackground"]) {
            if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Documents/snell/home.jpg"]) {
                UIImage *sbWallpaper = [UIImage imageWithContentsOfFile:@"/var/mobile/Documents/snell/home.jpg"];
                UIImageView *sbWallpaperView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
                [sbWallpaperView setImage:sbWallpaper];
                [sbWallpaperView addSubview:snellEffectView];
	            [self._dimmingView addSubview:sbWallpaperView];
            } else {
                UIImage *sbWallpaper = [UIImage imageWithContentsOfFile:@"/var/mobile/Documents/snell/lock.jpg"];
                UIImageView *sbWallpaperView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
                [sbWallpaperView setImage:sbWallpaper];
                [sbWallpaperView addSubview:snellEffectView];
	            [self._dimmingView addSubview:sbWallpaperView];
            }
        } else if ([useWallpaper isEqualToString:@"lockscreenBackground"]) {
            UIImage *sbWallpaper = [UIImage imageWithContentsOfFile:@"/var/mobile/Documents/snell/lock.jpg"];
            UIImageView *sbWallpaperView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            [sbWallpaperView setImage:sbWallpaper];
            [sbWallpaperView addSubview:snellEffectView];
	        [self._dimmingView addSubview:sbWallpaperView];
        }
        if (shouldOverlayBackgroundColor) {
            UIView *colorView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            [colorView setBackgroundColor:[UIColor cscp_colorFromHexString:customBackgroundColor]];
            [self._dimmingView addSubview:colorView];
        }
        if (shouldChangeTitleColor && [self preferredStyle] == 1) {
            UILabel *titleLabel = MSHookIvar<UILabel *>([self view], "_titleLabel");
            [titleLabel setTextColor:[UIColor cscp_colorFromHexString:titleColorHex]];
            MSHookIvar<UILabel *>([self view], "_titleLabel") = titleLabel;
        }
        if (shouldChangeMessageColor && [self preferredStyle] == 1) {
            UILabel *messageLabel = MSHookIvar<UILabel *>([self view], "_messageLabel");
            [messageLabel setTextColor:[UIColor cscp_colorFromHexString:messageColorHex]];
            MSHookIvar<UILabel *>([self view], "_messageLabel") = messageLabel;
        }
        if (shouldChangeAlertActionTextColor) {
            [[self view] setTintColor:[UIColor cscp_colorFromHexString:customAlertActionTextColor]];
        }
        [[self _foregroundView] setClipsToBounds:TRUE];
        [[[self _foregroundView] layer] setCornerRadius:backdropCornerRadius];
    } 
    %orig;
}

%end

%hook _UIDimmingKnockoutBackdropView

-(void)setBounds:(CGRect)arg1{
    if (enabled && themeMode == 0) {
        if ([NSStringFromClass([[self _viewControllerForAncestor] class]) isEqualToString:@"UIAlertController"] || useInHapticTouchMenus) {
            if (hideStockBackdrop) {
                UIView *backdropView = MSHookIvar<UIView *>(self, "backdropView");
                [backdropView setHidden:TRUE];
                MSHookIvar<UIView *>(self, "backdropView") = backdropView;
            }
            if (shouldUseBorder) {
                [[[self superview] layer] setBorderColor:[UIColor cscp_colorFromHexString:borderColor].CGColor];
                [[[self superview] layer] setBorderWidth:1.0f];
                [[[self superview] layer] setCornerRadius:borderCornerRadius];
            }
        [self setClipsToBounds:TRUE];
        [[self layer] setCornerRadius:backdropCornerRadius];
        }
    }
    %orig;
}

%end

%hook _UIInterfaceActionVibrantSeparatorView

-(void)_setupEffectView{
    if (enabled && themeMode == 0) {
        if ([separatorStyle isEqualToString:@"hideSeparators"]) {
            [self setHidden:TRUE];
        } else if ([separatorStyle isEqualToString:@"customSeparators"]) {
            [self setBackgroundColor:[UIColor cscp_colorFromHexString:customSeparatorColor]];
            float thickness = [customSeparatorThickness floatValue];
            [self setFrame:CGRectMake(self.frame.origin.x, ((self.frame.origin.y) - thickness/2), self.frame.size.width, thickness)];
        }
    }
    %orig;
}

%end


%hook _UIAlertControllerActionView

-(void)_updateStyle{
    if (enabled && themeMode == 0) {
        if (shouldChangeBottomHalfColor) {
            [self setBackgroundColor:[UIColor cscp_colorFromHexString:customBottomHalfColor]];
        }
    }
    %orig;
}

-(void)setHighlighted:(BOOL)arg1{
    if (enabled && themeMode == 0) {
        if (arg1) {
            if (shouldChangeActionHighlightColor) {
                highlightView = [[UIView alloc] initWithFrame:[self bounds]];
                [highlightView setBackgroundColor:[UIColor cscp_colorFromHexString:customActionHighlightColor]];
                [self addSubview:highlightView];
                [highlightView setHidden:FALSE];
            }
        } else {
            [highlightView setHidden:TRUE];
        }
    }
    %orig;
}

%end

%hook _UIInterfaceActionGroupHeaderScrollView

-(id)updateConstraints{
    if (enabled && themeMode == 0 && shouldChangeTopHalfColor) {
        [self setBackgroundColor:[UIColor cscp_colorFromHexString:customTopHalfColor]];
    }
    return %orig;
}


%end


%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {
    [[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Documents/snell/lock.jpg" error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Documents/snell/home.jpg" error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Documents/snell/lock-dark.jpg" error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Documents/snell/home-dark.jpg" error:nil];
    [[NSFileManager defaultManager] createDirectoryAtPath:@"/var/mobile/Documents/snell/" withIntermediateDirectories:TRUE attributes:nil error:nil];
    NSData *lockWallpaperData = [NSData dataWithContentsOfFile:@"/var/mobile/Library/SpringBoard/LockBackground.cpbitmap"];
	CFDataRef lockWallpaperDataRef = (__bridge CFDataRef)lockWallpaperData;
	NSArray *lsImageArray = (__bridge NSArray *)CPBitmapCreateImagesFromData(lockWallpaperDataRef, NULL, 1, NULL);
	UIImage *lsWallpaper = [UIImage imageWithCGImage:(CGImageRef)lsImageArray[0]];
    NSData *lockWallDataWrite = UIImageJPEGRepresentation(lsWallpaper, 1.0);
    [lockWallDataWrite writeToFile:@"/var/mobile/Documents/snell/lock.jpg" atomically:TRUE];
    NSData *darkLockWallpaperData = [NSData dataWithContentsOfFile:@"/var/mobile/Library/SpringBoard/LockBackgrounddark.cpbitmap"];
    CFDataRef darkLockWallpaperDataRef = (__bridge CFDataRef)darkLockWallpaperData;
    NSArray *darkLsImageArray = (__bridge NSArray *)CPBitmapCreateImagesFromData(darkLockWallpaperDataRef, NULL, 1, NULL);
    UIImage *darkLsWallpaper = [UIImage imageWithCGImage:(CGImageRef)darkLsImageArray[0]];
    NSData *darkLockWallDataWrite = UIImageJPEGRepresentation(darkLsWallpaper, 1.0);
    [darkLockWallDataWrite writeToFile:@"/var/mobile/Documents/snell/lock-dark.jpg" atomically:TRUE];    
    NSData *homeWallpaperData = [NSData dataWithContentsOfFile:@"/var/mobile/Library/SpringBoard/HomeBackground.cpbitmap"];
	CFDataRef homeWallpaperDataRef = (__bridge CFDataRef)homeWallpaperData;
	NSArray *sbImageArray = (__bridge NSArray *)CPBitmapCreateImagesFromData(homeWallpaperDataRef, NULL, 1, NULL);
	UIImage *sbWallpaper = [UIImage imageWithCGImage:(CGImageRef)sbImageArray[0]];
    NSData *sbWallDataWrite = UIImageJPEGRepresentation(sbWallpaper, 1.0);
    [sbWallDataWrite writeToFile:@"/var/mobile/Documents/snell/home.jpg" atomically:TRUE];
    NSData *darkHomeWallpaperData = [NSData dataWithContentsOfFile:@"/var/mobile/Library/SpringBoard/HomeBackgrounddark.cpbitmap"];
    CFDataRef darkHomeWallpaperDataRef = (__bridge CFDataRef)darkHomeWallpaperData;
    NSArray *darkSbImageArray = (__bridge NSArray *)CPBitmapCreateImagesFromData(darkHomeWallpaperDataRef, NULL, 1, NULL);
    UIImage *darkSbWallpaper = [UIImage imageWithCGImage:(CGImageRef)darkSbImageArray[0]];
    NSData *darkHomeWallDataWrite = UIImageJPEGRepresentation(darkSbWallpaper, 1.0);
    [darkHomeWallDataWrite writeToFile:@"/var/mobile/Documents/snell/Home-dark.jpg" atomically:TRUE];
	allowPresentHook = TRUE;
    %orig;
}

%end

%hook _UIAlertControlleriOSActionSheetCancelBackgroundView


-(void)setHighlighted:(BOOL)arg1{
    if (enabled && themeMode == 0 && hideCancelViewBackdrop) {
        [self setHidden:TRUE];
    }
    %orig;
}


%end

%ctor {
    if ([[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"/Application"] || [[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"SpringBoard.app"]) {
        HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
        [preferences registerBool:&enabled default:TRUE forKey:@"isEnabled"];
		[preferences registerInteger:&themeMode default:0 forKey:@"themeMode"];
        [preferences registerObject:&useWallpaper default:@"homescreenBackground" forKey:@"useWallpaper"];
        [preferences registerObject:&blurStyle default:@"unblurredStyle" forKey:@"blurStyle"];
        [preferences registerBool:&shouldChangeTitleColor default:FALSE forKey:@"shouldChangeTitleColor"];
        [preferences registerObject:&titleColorHex default:@"FF000000" forKey:@"customTitleColor"];
        [preferences registerBool:&shouldChangeMessageColor default:FALSE forKey:@"shouldChangeMessageColor"];
        [preferences registerObject:&messageColorHex default:@"FF000000" forKey:@"customMessageColor"];
        [preferences registerBool:&shouldChangeTopHalfColor default:FALSE forKey:@"shouldChangeTopHalfColor"];
        [preferences registerObject:&customTopHalfColor default:@"00000000" forKey:@"customTopHalfColor"];
        [preferences registerBool:&shouldChangeBottomHalfColor default:FALSE forKey:@"shouldChangeBottomHalfColor"];
        [preferences registerObject:&customBottomHalfColor default:@"00000000" forKey:@"customBottomHalfColor"];
        [preferences registerBool:&shouldChangeActionHighlightColor default:FALSE forKey:@"shouldChangeActionHighlightColor"];
        [preferences registerObject:&customActionHighlightColor default:@"FF007AFF" forKey:@"customActionHighlightColor"];
        [preferences registerBool:&hideStockBackdrop default:FALSE forKey:@"hideStockBackdrop"];
        [preferences registerObject:&separatorStyle default:@"stockSeparators" forKey:@"separatorStyle"];
        [preferences registerObject:&customSeparatorColor default:@"007AFF" forKey:@"customSeparatorColor"];
        [preferences registerBool:&shouldChangeAlertActionTextColor default:FALSE forKey:@"shouldChangeAlertActionTextColor"];
        [preferences registerObject:&customAlertActionTextColor default:@"007AFF" forKey:@"customAlertActionTextColor"];
        [preferences registerBool:&shouldOverlayBackgroundColor default:FALSE forKey:@"shouldOverlayBackgroundColor"];
        [preferences registerObject:&customBackgroundColor default:@"00000000" forKey:@"customBackgroundColor"];
        [preferences registerBool:&shouldUseBorder default:FALSE forKey:@"shouldUseBorder"];
        [preferences registerObject:&borderColor default:@"FF00000000" forKey:@"borderColor"];
        [preferences registerDouble:&borderCornerRadius default:10.0f forKey:@"borderCornerRadius"];
        [preferences registerDouble:&backdropCornerRadius default:10.0f forKey:@"backdropCornerRadius"];
        [preferences registerBool:&hideCancelViewBackdrop default:TRUE forKey:@"hideCancelViewBackdrop"];
        [preferences registerBool:&useInHapticTouchMenus default:TRUE forKey:@"useInHapticTouchMenus"];
		[preferences registerObject:&airpodsBackgroundColor default:@"FFFFFFFF" forKey:@"airpodsBackgroundColor"];
		[preferences registerObject:&airpodsTitleColor default:@"000000" forKey:@"airpodsTitleColor"];
		[preferences registerObject:&airpodsMessageColor default:@"000000" forKey:@"airpodsMessageColor"];
		[preferences registerObject:&customAirpodsActionTextColor default:@"000000" forKey:@"customAirpodsActionTextColor"];
		[preferences registerObject:&airpodsDefaultActionColor default:@"FFD1CEDC" forKey:@"airpodsDefaultActionColor"];
		[preferences registerObject:&airpodsCancelActionColor default:@"FFD1CEDC" forKey:@"airpodsCancelActionColor"];
		[preferences registerObject:&airpodsDestructiveActionColor default:@"55AA0000" forKey:@"airpodsDestructiveActionColor"];
		allowPresentHook = TRUE;
        %init;
    }
}
