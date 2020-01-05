extern CFArrayRef CPBitmapCreateImagesFromData(CFDataRef cpbitmap, void*, int, void*);
UIAlertController *currentAlert;

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


%hook UIAlertController

-(void)viewWillAppear:(BOOL)arg1{
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
    currentAlert = self;
    %orig;
}

%end

%hook _UIDimmingKnockoutBackdropView

-(void)setBounds:(CGRect)arg1{
    [self setHidden:TRUE];
    %orig;
}

%end

%hook _UIInterfaceActionVibrantSeparatorView

-(void)_setupEffectView{
    [self setHidden:TRUE];
    %orig;
}

%end


%hook _UIAlertControllerActionView


-(void)setAlertController:(UIAlertController*)arg1{
    [self setBackgroundColor:[UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.3]];
    %orig;
}

-(void)setHighlighted:(BOOL)arg1{
    if (arg1) {
        [self setBackgroundColor:[UIColor greenColor]];
        %orig;
    } else {
        [self setBackgroundColor:[UIColor colorWithRed:(0.0/255.0) green:(0.0/255.0) blue:(0.0/255.0) alpha:0.3]];
        %orig;
    }
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

#pragma mark Remembering Actions


%hook UIAlertAction

+(id)actionWithTitle:(NSString *)arg1 style:(long long)arg2 handler:(void (^)(void))arg3{
    if (![[currentAlert title] isEqualToString:@"Snell: Remember this action?"]){
        if (![[currentAlert message] isEqualToString:@"Would you like to remember this decision in the future?"]){
            if (arg3 == nil) {
                void(^newCompletionBlock)(void) = ^{
                    NSLog(@"%@", [NSString stringWithFormat:@"SNELL: Alert title was: %@\n Message was: %@\n chosen action was: %@\n", [currentAlert title], [currentAlert message], arg1]);
                    UIAlertController *rememberMeController = [UIAlertController alertControllerWithTitle:@"Snell: Remember this action?" message:@"Would you like to remember this decision in the future?" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *rememberAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        NSMutableDictionary *brainDictionary = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/PreferenceBundles/snellprefs.bundle/brain.plist"]];
                        [brain setObject:arg1 forKey:[NSString stringWithFormat:@"%@+%@", [currentAlert title], [currentAlert message]]];

                    }];
                    UIAlertAction *forgetAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
                    [rememberMeController addAction:rememberAction];
                    [rememberMeController addAction:forgetAction];
                    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:rememberMeController animated:TRUE completion:nil];
                };
                return %orig(arg1, arg2, newCompletionBlock);
            } else {
                void(^newCompletionBlock)(void) = ^{
                    arg3();
                    NSLog(@"%@", [NSString stringWithFormat:@"SNELL: Alert title was: %@\n Message was: %@\n chosen action was: %@\n", [currentAlert title], [currentAlert message], arg1]);
                    UIAlertController *rememberMeController = [UIAlertController alertControllerWithTitle:@"Snell: Remember this action?" message:@"Would you like to remember this decision in the future?" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *rememberAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        NSMutableDictionary *brainDictionary = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/PreferenceBundles/snellprefs.bundle/brain.plist"]];
                        [brain setObject:arg1 forKey:[NSString stringWithFormat:@"%@+%@", [currentAlert title], [currentAlert message]]];
                        
                    }];
                    UIAlertAction *forgetAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
                    [rememberMeController addAction:rememberAction];
                    [rememberMeController addAction:forgetAction];
                    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:rememberMeController animated:TRUE completion:nil];
                };
                return %orig(arg1, arg2, newCompletionBlock);
            }
        } else {
            return %orig;
        }
    } else {
        return %orig;
    }
}

%end
