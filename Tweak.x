UIImage *sbWallpaper;

@interface UIAlertController (private)
@property (readonly) UIView *_dimmingView;
@end

@interface UIView (private)
@property NSArray *allSubviews;
@end

@interface _UIDimmingKnockoutBackdropView : UIView
@end

@interface SBFStaticWallpaperView : UIView
-(UIImage *)_displayedImage;
@end

%hook UIAlertController

-(void)viewWillAppear:(BOOL)arg1{
    BOOL useSpringBoardWallpaper = 0;
    if (useSpringBoardWallpaper) {
        UIImageView *sbWallpaperView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [sbWallpaperView setImage:sbWallpaper];
        UIVisualEffectView *snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [snellEffectView setFrame:[[UIScreen mainScreen] bounds]];
        [sbWallpaperView addSubview:snellEffectView];
	    [self._dimmingView addSubview:snellEffectView];
    } else {
        UIVisualEffectView *snellEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [snellEffectView setFrame:[[UIScreen mainScreen] bounds]];
        [self._dimmingView addSubview:snellEffectView];
    }
    %orig;
}

%end

%hook _UIDimmingKnockoutBackdropView

-(void)setBounds:(CGRect)arg1{
    [self setHidden:TRUE];
    %orig;
}

%end

%hook SBFStaticWallpaperView

-(void)setContentsRect:(CGRect)arg1{
    sbWallpaper = [self _displayedImage];
    %orig;
}

%end

