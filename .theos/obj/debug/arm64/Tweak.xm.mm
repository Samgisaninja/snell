#line 1 "Tweak.xm"
#import <Cephei/HBPreferences.h>
#include <CSColorPicker/CSColorPicker.h>
#include <RemoteLog.h>

extern "C" CFArrayRef CPBitmapCreateImagesFromData(CFDataRef cpbitmap, void*, int, void*);

BOOL enabled;
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

@interface _UIInterfaceActionGroupHeaderScrollView : UIView
@end

@interface UIAlertController ()
@property (readonly) UIView *_dimmingView;
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
@end

@interface UIView ()
@end

@interface _UIDimmingKnockoutBackdropView : UIView
@end

@interface SBFStaticWallpaperView : UIView
-(UIImage *)_displayedImage;
@end

#pragma mark Appearance



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _UIInterfaceActionVibrantSeparatorView; @class _UIAlertControllerActionView; @class SpringBoard; @class UIAlertController; @class _UIInterfaceActionGroupHeaderScrollView; @class _UIDimmingKnockoutBackdropView; 
static void (*_logos_orig$_ungrouped$UIAlertController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$)(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$_UIAlertControllerActionView$_updateStyle)(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIAlertControllerActionView$_updateStyle(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$)(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionGroupHeaderScrollView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionGroupHeaderScrollView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); 

#line 67 "Tweak.xm"


static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    if (enabled) {
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
    } 
    _logos_orig$_ungrouped$UIAlertController$viewWillAppear$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
    _logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(self, _cmd, arg1);
    if (enabled && hideStockBackdrop) {
        UIView *backdropView = MSHookIvar<UIView *>(self, "backdropView");
        [backdropView setHidden:TRUE];
        MSHookIvar<UIView *>(self, "backdropView") = backdropView;
    }
    if (enabled && shouldUseBorder) {
        [[[self superview] layer] setBorderColor:[UIColor cscp_colorFromHexString:borderColor].CGColor];
        [[[self superview] layer] setBorderWidth:1.0f];
        [[[self superview] layer] setCornerRadius:borderCornerRadius];
    }
    if (enabled) {
        [self setClipsToBounds:TRUE];
        [[self layer] setCornerRadius:backdropCornerRadius];
    }
}





static void _logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (enabled) {
        if ([separatorStyle isEqualToString:@"hideSeparators"]) {
            [self setHidden:TRUE];
        } else if ([separatorStyle isEqualToString:@"customSeparators"]) {
            [self setBackgroundColor:[UIColor cscp_colorFromHexString:customSeparatorColor]];
            float thickness = [customSeparatorThickness floatValue];
            [self setFrame:CGRectMake(self.frame.origin.x, ((self.frame.origin.y) - thickness/2), self.frame.size.width, thickness)];
        }
    }
    _logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(self, _cmd);
}






static void _logos_method$_ungrouped$_UIAlertControllerActionView$_updateStyle(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (enabled) {
        UIStackView *alertActionsView = (UIStackView *)[[self superview] superview];
        if ([[alertActionsView arrangedSubviews] count] > 0) {
            _UIInterfaceActionCustomViewRepresentationView *lastActionView = [[alertActionsView arrangedSubviews] lastObject];
            if ([[[self action] title] isEqualToString:[[[lastActionView _actionContentView] action] title]]) {
                NSLog(@"SNELL TESTING: %@ was equal to %@", [[self action] title], [[[lastActionView _actionContentView] action] title]);
                [self setClipsToBounds:TRUE];
                [[self layer] setCornerRadius:backdropCornerRadius];
                [[self layer] setMaskedCorners:kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner];
            } else {
                NSLog(@"SNELL TESTING: %@ was not equal to %@", [[self action] title], [[[lastActionView _actionContentView] action] title]);
            }
        }
        if (shouldChangeBottomHalfColor) {
            [self setBackgroundColor:[UIColor cscp_colorFromHexString:customBottomHalfColor]];
        }
    }
    _logos_orig$_ungrouped$_UIAlertControllerActionView$_updateStyle(self, _cmd);
}

static void _logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    if (enabled) {
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
    _logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$(self, _cmd, arg1);
}





static id _logos_method$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionGroupHeaderScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    [self setClipsToBounds:TRUE];
    [[self layer] setCornerRadius:backdropCornerRadius];
    [[self layer] setMaskedCorners:kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner];
    if (shouldChangeTopHalfColor && enabled) {
        [self setBackgroundColor:[UIColor cscp_colorFromHexString:customTopHalfColor]];
    }
    return _logos_orig$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints(self, _cmd);
}







static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
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
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);
}



static __attribute__((constructor)) void _logosLocalCtor_2b60e928(int __unused argc, char __unused **argv, char __unused **envp) {
    if ([[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"/Application"] || [[[[NSProcessInfo processInfo] arguments] objectAtIndex:0] containsString:@"SpringBoard.app"]) {
        HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.samgisaninja.snellprefs"];
        [preferences registerBool:&enabled default:TRUE forKey:@"isEnabled"];
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
        {Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); MSHookMessageEx(_logos_class$_ungrouped$UIAlertController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$UIAlertController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$UIAlertController$viewWillAppear$);Class _logos_class$_ungrouped$_UIDimmingKnockoutBackdropView = objc_getClass("_UIDimmingKnockoutBackdropView"); MSHookMessageEx(_logos_class$_ungrouped$_UIDimmingKnockoutBackdropView, @selector(setBounds:), (IMP)&_logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$, (IMP*)&_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$);Class _logos_class$_ungrouped$_UIInterfaceActionVibrantSeparatorView = objc_getClass("_UIInterfaceActionVibrantSeparatorView"); MSHookMessageEx(_logos_class$_ungrouped$_UIInterfaceActionVibrantSeparatorView, @selector(_setupEffectView), (IMP)&_logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView, (IMP*)&_logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView);Class _logos_class$_ungrouped$_UIAlertControllerActionView = objc_getClass("_UIAlertControllerActionView"); MSHookMessageEx(_logos_class$_ungrouped$_UIAlertControllerActionView, @selector(_updateStyle), (IMP)&_logos_method$_ungrouped$_UIAlertControllerActionView$_updateStyle, (IMP*)&_logos_orig$_ungrouped$_UIAlertControllerActionView$_updateStyle);MSHookMessageEx(_logos_class$_ungrouped$_UIAlertControllerActionView, @selector(setHighlighted:), (IMP)&_logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$, (IMP*)&_logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$);Class _logos_class$_ungrouped$_UIInterfaceActionGroupHeaderScrollView = objc_getClass("_UIInterfaceActionGroupHeaderScrollView"); MSHookMessageEx(_logos_class$_ungrouped$_UIInterfaceActionGroupHeaderScrollView, @selector(updateConstraints), (IMP)&_logos_method$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints, (IMP*)&_logos_orig$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);}
    }
}
