#line 1 "Tweak.x"
@interface UIAlertController (private)
@property (readonly) UIView *_dimmingView;
@end

@interface UIView (private)
@property NSArray *allSubviews;
@end

@interface _UIDimmingKnockoutBackdropView : UIView
@end


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

@class _UIDimmingKnockoutBackdropView; @class UIAlertController; 
static void (*_logos_orig$_ungrouped$UIAlertController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$)(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST, SEL, CGRect); 

#line 12 "Tweak.x"


static void _logos_method$_ungrouped$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
	[self._dimmingView setHidden:TRUE];
    _logos_orig$_ungrouped$UIAlertController$viewWillAppear$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(_LOGOS_SELF_TYPE_NORMAL _UIDimmingKnockoutBackdropView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
    [self setHidden:TRUE];
    _logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$(self, _cmd, arg1);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); MSHookMessageEx(_logos_class$_ungrouped$UIAlertController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$UIAlertController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$UIAlertController$viewWillAppear$);Class _logos_class$_ungrouped$_UIDimmingKnockoutBackdropView = objc_getClass("_UIDimmingKnockoutBackdropView"); MSHookMessageEx(_logos_class$_ungrouped$_UIDimmingKnockoutBackdropView, @selector(setBounds:), (IMP)&_logos_method$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$, (IMP*)&_logos_orig$_ungrouped$_UIDimmingKnockoutBackdropView$setBounds$);} }
#line 29 "Tweak.x"
