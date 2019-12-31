@interface UIAlertController (private)
@property (readonly) UIView *_dimmingView;
@end

%hook UIAlertController

-(void)viewWillAppear:(BOOL)arg1{
	[self._dimmingView setHidden:TRUE];
    %orig;
}


%end
