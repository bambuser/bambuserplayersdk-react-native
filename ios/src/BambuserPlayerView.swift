import Foundation
import BambuserPlayerSDK
 
@objc(BambuserPlayerView)
class BambuserPlayerView: UIView {

    @objc var showId: String = "" {
        didSet {
            if !oldValue.isEmpty && !showId.isEmpty && oldValue != showId {
                ReactLogWarn("Can't change `showId` property: you need to re-create view")
                return
            }
            if controller != nil {
                return
            }
            self.controller = createController()
        }
    }
    
    @objc var onPlayerEvent: RCTBubblingEventBlock?
    
    var controller: BambuserPlayerViewController? {
        didSet {
            guard let controller else { return }
            configurePlayer(controller)
        }
    }
    
    private func createController() -> BambuserPlayerViewController {
        BambuserPlayerViewController(
            showId: showId,
            handlePlayerEvent: { [weak self] event in
                guard
                    let eventData = event.asDict() as? [AnyHashable : Any]
                else { return }
                self?.onPlayerEvent?(eventData)
            }
        )
    }
    
    private func configurePlayer(_ controller: BambuserPlayerViewController) {
        addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        setNeedsLayout()
    }
}
