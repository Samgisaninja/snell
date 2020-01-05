#line 1 "Tweak.x"
extern CFArrayRef CPBitmapCreateImagesFromData(CFDataRef cpbitmap, void*, int, void*);
NSString *alertTitle;
NSString *alertMessage;

@interface UIApplication (private)
-(UIWindow *)keyWindow;
@end

@interface UIAlertController (private)
@property (readonly) UIView *_dimmingView;
@end

@interface _UIAlertControllerActionView : UIView
-(void)setBackgroundColor:(UIColor *)arg1;
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

@class SpringBoard; @class _UIInterfaceActionVibrantSeparatorView; @class _UIAlertControllerActionView; @class _UIDimmingKnockoutBackdropView; @class UIAlertAction; @class UIAlertController; 
static void (*_logos_orig$_ungrouped$UIAlertController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$)(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$_UIAlertControllerActionView$setAlertController$)(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, UIAlertController*); static void _logos_method$_ungrouped$_UIAlertControllerActionView$setAlertController$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, UIAlertController*); static void (*_logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$)(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, long long, void (^)(void)); static id _logos_meta_method$_ungrouped$UIAlertAction$actionWithTitle$style$handler$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, long long, void (^)(void)); 

#line 33 "Tweak.x"


static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    BOOL useSpringBoardWallpaper = 1;
    if (useSpringBoardWallpaper) {
        UIImage *sbWallpaper = [UIImage imageWithContentsOfFile:@"/var/mobile/Documents/snell/home.jpg"];
        UIImageView *sbWallpaperView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [sbWallpaperView setImage:sbWallpaper];
        UIVisualEffectView *snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [snellEffectView setFrame:[[UIScreen mainScreen] bounds]];
        [sbWallpaperView addSubview:snellEffectView];
	    [self._dimmingView addSubview:sbWallpaperView];
    } else {
        UIVisualEffectView *snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [snellEffectView setFrame:[[UIScreen mainScreen] bounds]];
        [self._dimmingView addSubview:snellEffectView];
    }
    alertTitle = [self title];
    alertMessage = [self message];
    _logos_orig$_ungrouped$UIAlertController$viewWillAppear$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
    [self setHidden:TRUE];
    _logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    [self setHidden:TRUE];
    _logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView(self, _cmd);
}







static void _logos_method$_ungrouped$_UIAlertControllerActionView$setAlertController$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIAlertController* arg1){
    [self setBackgroundColor:[UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.3]];
    _logos_orig$_ungrouped$_UIAlertControllerActionView$setAlertController$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL _UIAlertControllerActionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
    if (arg1) {
        [self setBackgroundColor:[UIColor greenColor]];
        _logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$(self, _cmd, arg1);
    } else {
        [self setBackgroundColor:[UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.3]];
        _logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$(self, _cmd, arg1);
    }
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
    if (![alertTitle isEqualToString:@"Snell: Remember this action?"]){
        if (![alertMessage isEqualToString:@"Would you like to remember this decision in the future?"]){
            if (arg3 == nil) {
                void(^newCompletionBlock)(void) = ^{
                    NSLog(@"%@", [NSString stringWithFormat:@"SNELL: Alert title was: %@\n Message was: %@\n chosen action was: %@\n", alertTitle, alertMessage, arg1]);
                    UIAlertController *rememberMeController = [UIAlertController alertControllerWithTitle:@"Snell: Remember this action?" message:@"Would you like to remember this decision in the future?" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *rememberAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        NSLog(@"SNELL: User elected to remember action decision");
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
                    NSLog(@"%@", [NSString stringWithFormat:@"SNELL: Alert title was: %@\n Message was: %@\n chosen action was: %@\n", alertTitle, alertMessage, arg1]);
                    UIAlertController *rememberMeController = [UIAlertController alertControllerWithTitle:@"Snell: Remember this action?" message:@"Would you like to remember this decision in the future?" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *rememberAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        NSLog(@"SNELL: User elected to remember action decision");
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
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); MSHookMessageEx(_logos_class$_ungrouped$UIAlertController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$UIAlertController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$UIAlertController$viewWillAppear$);Class _logos_class$_ungrouped$_UIDimmingKnockoutBackdropView = objc_getClass("_UIDimmingKnockoutBackdropView"); MSHookMessageEx(_logos_class$_ungrouped$_UIDimmingKnockoutBackdropView, @selector(setBounds:), (IMP)&_logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$, (IMP*)&_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$);Class _logos_class$_ungrouped$_UIInterfaceActionVibrantSeparatorView = objc_getClass("_UIInterfaceActionVibrantSeparatorView"); MSHookMessageEx(_logos_class$_ungrouped$_UIInterfaceActionVibrantSeparatorView, @selector(_setupEffectView), (IMP)&_logos_method$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView, (IMP*)&_logos_orig$_ungrouped$_UIInterfaceActionVibrantSeparatorView$_setupEffectView);Class _logos_class$_ungrouped$_UIAlertControllerActionView = objc_getClass("_UIAlertControllerActionView"); MSHookMessageEx(_logos_class$_ungrouped$_UIAlertControllerActionView, @selector(setAlertController:), (IMP)&_logos_method$_ungrouped$_UIAlertControllerActionView$setAlertController$, (IMP*)&_logos_orig$_ungrouped$_UIAlertControllerActionView$setAlertController$);MSHookMessageEx(_logos_class$_ungrouped$_UIAlertControllerActionView, @selector(setHighlighted:), (IMP)&_logos_method$_ungrouped$_UIAlertControllerActionView$setHighlighted$, (IMP*)&_logos_orig$_ungrouped$_UIAlertControllerActionView$setHighlighted$);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);Class _logos_class$_ungrouped$UIAlertAction = objc_getClass("UIAlertAction"); Class _logos_metaclass$_ungrouped$UIAlertAction = object_getClass(_logos_class$_ungrouped$UIAlertAction); MSHookMessageEx(_logos_metaclass$_ungrouped$UIAlertAction, @selector(actionWithTitle:style:handler:), (IMP)&_logos_meta_method$_ungrouped$UIAlertAction$actionWithTitle$style$handler$, (IMP*)&_logos_meta_orig$_ungrouped$UIAlertAction$actionWithTitle$style$handler$);} }
#line 181 "Tweak.x"
