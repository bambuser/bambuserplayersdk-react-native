#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(BambuserPlayerViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(showId, NSString)
RCT_EXPORT_VIEW_PROPERTY(onPlayerEvent, RCTBubblingEventBlock)

@end
