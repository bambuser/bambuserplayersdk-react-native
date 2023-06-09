import Foundation
 
@objc(BambuserPlayerViewManager)
class BambuserPlayerViewManager: RCTViewManager {

  override func view() -> BambuserPlayerView {
    BambuserPlayerView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
