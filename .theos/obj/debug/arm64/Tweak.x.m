#line 1 "Tweak.x"
#import <Cephei/HBPreferences.h>
#include <CSColorPicker/CSColorPicker.h>

extern CFArrayRef CPBitmapCreateImagesFromData(CFDataRef cpbitmap, void*, int, void*);

UIAlertController *currentAlert;
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
NSMutableDictionary *brain;

@interface _UIInterfaceActionGroupHeaderScrollView : UIView
@end

@interface UIAlertController (private)
@property (readonly) UIView *_dimmingView;
@end

@interface _UIAlertControllerActionView : UIView
-(void)setBackgroundColor:(UIColor *)arg1;
-(UIAlertAction *)action;
@end

@interface _UIInterfaceActionVibrantSeparatorView : UIView
@end

@interface UIView (private)
@property NSArray *allSubviews;
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

@class _UIInterfaceActionVibrantSeparatorView; @class UIAlertController; @class _UIInterfaceActionGroupHeaderScrollView; @class UIAlertAction; @class _UIDimmingKnockoutBackdropView; @class _UIAlertControllerActionView; @class SpringBoard; 
static void (*_logos_orig$_ungrouped$UIAlertController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$)(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$_UIAlertControllerActionView$_updateStyle)(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIAlertControllerActionView$_updateStyle(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$)(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionGroupHeaderScrollView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionGroupHeaderScrollView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, long long, void (^)(void)); static id _logos_meta_method$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, long long, void (^)(void)); 

#line 52 "Tweak.x"


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
        if (shouldChangeTitleColor) {
            NSArray *alertControllerView = [[self view] allSubviews];
            for (id object in alertControllerView) {
                if ([NSStringFromClass([object class]) isEqualToString:@"UILabel"]){
                    UILabel *possibleTitleLabel = (UILabel *)object;
                    if ([[possibleTitleLabel text] isEqualToString:[self title]]) {
                        [possibleTitleLabel setTextColor:[UIColor cscp_colorFromHexString:titleColorHex]];
                    }
                }
            }
        }
        if (shouldChangeMessageColor) {
            NSArray *alertControllerView = [[self view] allSubviews];
            for (id object in alertControllerView) {
                if ([NSStringFromClass([object class]) isEqualToString:@"UILabel"]){
                    UILabel *possibleMessageLabel = (UILabel *)object;
                    if ([[possibleMessageLabel text] isEqualToString:[self message]]) {
                        [possibleMessageLabel setTextColor:[UIColor cscp_colorFromHexString:messageColorHex]];
                    }
                }
            }
        }
    }
    currentAlert = self;
    _logos_orig$_ungrouped$UIAlertController$viewWillAppear$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
    if (enabled) {
        [self setHidden:TRUE];
    }
    _logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (enabled) {
        [self setHidden:TRUE];
    }
    _logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(self, _cmd);
}






static void _logos_method$_ungrouped$_UIAlertControllerActionView$_updateStyle(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (enabled) {
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
    if (shouldChangeTopHalfColor) {
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



#pragma mark Remembering Actions




static id _logos_meta_method$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1, long long arg2, void (^arg3)(void)){
    if (enabled) {
        if (![[currentAlert title] isEqualToString:@"Snell: Remember this action?"]){
            if (![[currentAlert message] isEqualToString:@"Would you like to remember this decision in the future?"]){
                if (arg3 == nil) {
                    void(^newCompletionBlock)(void) = ^{
                        NSLog(@"%@", [NSString stringWithFormat:@"SNELL: Alert title was: %@\n Message was: %@\n chosen action was: %@\n", [currentAlert title], [currentAlert message], arg1]);
                        UIAlertController *rememberMeController = [UIAlertController alertControllerWithTitle:@"Snell: Remember this action?" message:@"Would you like to remember this decision in the future?" preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *rememberAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            [brain setObject:arg1 forKey:[NSString stringWithFormat:@"%@+%@", [currentAlert title], [currentAlert message]]];
                            
                        }];
                        UIAlertAction *forgetAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
                        [rememberMeController addAction:rememberAction];
                        [rememberMeController addAction:forgetAction];
                        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:rememberMeController animated:TRUE completion:nil];
                    };
                    return _logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(self, _cmd, arg1, arg2, newCompletionBlock);
                } else {
                    void(^newCompletionBlock)(void) = ^{
                        arg3();
                        NSLog(@"%@", [NSString stringWithFormat:@"SNELL: Alert title was: %@\n Message was: %@\n chosen action was: %@\n", [currentAlert title], [currentAlert message], arg1]);
                        UIAlertController *rememberMeController = [UIAlertController alertControllerWithTitle:@"Snell: Remember this action?" message:@"Would you like to remember this decision in the future?" preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *rememberAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            [brain setObject:arg1 forKey:[NSString stringWithFormat:@"%@+%@", [currentAlert title], [currentAlert message]]];
                            
                        }];
                        UIAlertAction *forgetAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
                        [rememberMeController addAction:rememberAction];
                        [rememberMeController addAction:forgetAction];
                        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:rememberMeController animated:TRUE completion:nil];
                    };
                    return _logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(self, _cmd, arg1, arg2, newCompletionBlock);
                }
            } else {
                return _logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(self, _cmd, arg1, arg2, arg3);
            }
        } else {
            return _logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(self, _cmd, arg1, arg2, arg3);
        }
    } else {
        return _logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(self, _cmd, arg1, arg2, arg3);
    }
}



static __attribute__((constructor)) void _logosLocalCtor_e9f7249a(int __unused argc, char __unused **argv, char __unused **envp) {
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
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); MSHookMessageEx(_logos_class$_ungrouped$UIAlertController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$UIAlertController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$UIAlertController$viewWillAppear$);Class _logos_class$_ungrouped$_UIDimmingKnockoutBackdropView = objc_getClass("_UIDimmingKnockoutBackdropView"); MSHookMessageEx(_logos_class$_ungrouped$_UIDimmingKnockoutBackdropView, @selector(setBounds:), (IMP)&_logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$, (IMP*)&_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$);Class _logos_class$_ungrouped$_UIInterfaceActionVibrantSeparatorView = objc_getClass("_UIInterfaceActionVibrantSeparatorView"); MSHookMessageEx(_logos_class$_ungrouped$_UIInterfaceActionVibrantSeparatorView, @selector(_setupEffectView), (IMP)&_logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView, (IMP*)&_logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView);Class _logos_class$_ungrouped$_UIAlertControllerActionView = objc_getClass("_UIAlertControllerActionView"); MSHookMessageEx(_logos_class$_ungrouped$_UIAlertControllerActionView, @selector(_updateStyle), (IMP)&_logos_method$_ungrouped$_UIAlertControllerActionView$_updateStyle, (IMP*)&_logos_orig$_ungrouped$_UIAlertControllerActionView$_updateStyle);MSHookMessageEx(_logos_class$_ungrouped$_UIAlertControllerActionView, @selector(setHighlighted:), (IMP)&_logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$, (IMP*)&_logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$);Class _logos_class$_ungrouped$_UIInterfaceActionGroupHeaderScrollView = objc_getClass("_UIInterfaceActionGroupHeaderScrollView"); MSHookMessageEx(_logos_class$_ungrouped$_UIInterfaceActionGroupHeaderScrollView, @selector(updateConstraints), (IMP)&_logos_method$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints, (IMP*)&_logos_orig$_ungrouped$_UIInterfaceActionGroupHeaderScrollView$updateConstraints);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);Class _logos_class$_ungrouped$UIAlertAction = objc_getClass("UIAlertAction"); Class _logos_metaclass$_ungrouped$UIAlertAction = object_getClass(_logos_class$_ungrouped$UIAlertAction); MSHookMessageEx(_logos_metaclass$_ungrouped$UIAlertAction, @selector(actionWithTitle:style:handler:), (IMP)&_logos_meta_method$_ungrouped$UIAlertAction$actionWithTitle$style$handler$, (IMP*)&_logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$);} }
#line 293 "Tweak.x"
