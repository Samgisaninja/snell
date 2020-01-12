#import <Cephei/HBPreferences.h>
#include <CSColorPicker/CSColorPicker.h>

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

@interface _UIInterfaceActionGroupHeaderScrollView : UIView
@end

@interface UIAlertController ()
@property (readonly) UIView *_dimmingView;
@end

@interface _UIAlertControllerActionView : UIView
-(void)setBackgroundColor:(UIColor *)arg1;
-(UIAlertAction *)action;
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


%hook UIAlertController

-(void)viewWillAppear:(BOOL)arg1{
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
    %orig;
}

%end

%hook _UIDimmingKnockoutBackdropView

-(void)setBounds:(CGRect)arg1{
    if (enabled && hideStockBackdrop) {
        UIView *backdropView = MSHookIvar<UIView *>(self, "backdropView");
        [backdropView setHidden:TRUE];
        MSHookIvar<UIView *>(self, "backdropView") = backdropView;
    }
    if (enabled && shouldUseBorder) {
        [[[self superview] layer] setBorderColor:[UIColor cscp_colorFromHexString:borderColor].CGColor];
        [[[self superview] layer] setBorderWidth:1.0f];
    }
    %orig;
}

%end

%hook _UIInterfaceActionVibrantSeparatorView

-(void)_setupEffectView{
    if (enabled) {
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
    if (enabled) {
        if (shouldChangeBottomHalfColor) {
            [self setBackgroundColor:[UIColor cscp_colorFromHexString:customBottomHalfColor]];
        }
    }
    %orig;
}

-(void)setHighlighted:(BOOL)arg1{
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
    %orig;
}

%end

%hook _UIInterfaceActionGroupHeaderScrollView

-(id)updateConstraints{
    if (shouldChangeTopHalfColor && enabled) {
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
    %orig;
}

%end

%ctor {
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
}
