@interface UIAlertController (private)
@property (readonly) UIView *_dimmingView;
@end

@interface UIView (private)
@property NSArray *allSubviews;
@end

@interface _UIDimmingKnockoutBackdropView : UIView
@end

%hook UIAlertController

-(void)viewWillAppear:(BOOL)arg1{
	[self._dimmingView setHidden:TRUE];
    %orig;
}

%end

%hook _UIDimmingKnockoutBackdropView

-(void)setBounds:(CGRect)arg1{
    [self setHidden:TRUE];
    %orig;
}

%end
