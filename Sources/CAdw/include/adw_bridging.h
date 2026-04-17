#include <sys/types.h>
#include <stdint.h>
#include <adwaita.h>

/*
 * Swift's Clang importer only imports a C struct typedef when the
 * struct itself has a body. libadwaita follows the GNOME idiom of
 * forward-declaring opaque instance and class types via
 * G_DECLARE_FINAL_TYPE / the *Class half of G_DECLARE_DERIVABLE_TYPE,
 * which would otherwise be invisible to Swift. Provide empty struct
 * bodies here so every Adw type surfaces as a Swift type.
 */
struct _AdwAboutDialog {};
struct _AdwAboutWindow {};
struct _AdwAnimationClass {};
struct _AdwAnimationTarget {};
struct _AdwAnimationTargetClass {};
struct _AdwAvatar {};
struct _AdwBanner {};
struct _AdwBottomSheet {};
struct _AdwBreakpoint {};
struct _AdwBreakpointCondition {};
struct _AdwButtonContent {};
struct _AdwButtonRow {};
struct _AdwCallbackAnimationTarget {};
struct _AdwCallbackAnimationTargetClass {};
struct _AdwCarousel {};
struct _AdwCarouselIndicatorDots {};
struct _AdwCarouselIndicatorLines {};
struct _AdwClamp {};
struct _AdwClampLayout {};
struct _AdwClampScrollable {};
struct _AdwEnumListItem {};
struct _AdwEnumListModel {};
struct _AdwFlap {};
struct _AdwHeaderBar {};
struct _AdwInlineViewSwitcher {};
struct _AdwLayout {};
struct _AdwLayoutSlot {};
struct _AdwLeaflet {};
struct _AdwLeafletPage {};
struct _AdwMultiLayoutView {};
struct _AdwNavigationSplitView {};
struct _AdwNavigationView {};
struct _AdwNoneAnimationTarget {};
struct _AdwNoneAnimationTargetClass {};
struct _AdwOverlaySplitView {};
struct _AdwPasswordEntryRow {};
struct _AdwPropertyAnimationTarget {};
struct _AdwPropertyAnimationTargetClass {};
struct _AdwShortcutLabel {};
struct _AdwShortcutsDialog {};
struct _AdwShortcutsItem {};
struct _AdwShortcutsSection {};
struct _AdwSidebar {};
struct _AdwSidebarSection {};
struct _AdwSpinRow {};
struct _AdwSpinner {};
struct _AdwSpinnerPaintable {};
struct _AdwSplitButton {};
struct _AdwSpringAnimation {};
struct _AdwSpringAnimationClass {};
struct _AdwSpringParams {};
struct _AdwSqueezer {};
struct _AdwSqueezerPage {};
struct _AdwStatusPage {};
struct _AdwStyleManager {};
struct _AdwSwipeTracker {};
struct _AdwSwipeable {};
struct _AdwSwitchRow {};
struct _AdwTabBar {};
struct _AdwTabButton {};
struct _AdwTabOverview {};
struct _AdwTabPage {};
struct _AdwTabView {};
struct _AdwTimedAnimation {};
struct _AdwTimedAnimationClass {};
struct _AdwToast {};
struct _AdwToastOverlay {};
struct _AdwToggle {};
struct _AdwToggleGroup {};
struct _AdwToolbarView {};
struct _AdwViewStack {};
struct _AdwViewStackPage {};
struct _AdwViewStackPages {};
struct _AdwViewSwitcher {};
struct _AdwViewSwitcherBar {};
struct _AdwViewSwitcherSidebar {};
struct _AdwViewSwitcherTitle {};
struct _AdwWindowTitle {};
struct _AdwWrapBox {};
struct _AdwWrapLayout {};
