import BambuserPlayerSDK

extension BambuserPlayerEvent {
    
    func asDict() -> NSDictionary? {
        switch self {
        case let .playerFailed(error):
            return create(name: "playerFailed", data: ["error": error.localizedDescription])
        case let .openTosOrPpUrl(url):
            return create(name: "openTosOrPpUrl", data: ["url": url.absoluteString])
        case let .openUrlFromChat(url):
            return create(name: "openUrlFromChat", data: ["url": url.absoluteString])
        case let .openProduct(product):
            return create(
                name: "openProduct",
                data: [
                    "product": product.asDict()
                ]
            )
        case let .openShareShowSheet(url):
            return create(name: "openShareShowSheet", data: ["url": url.absoluteString])
        case .openCart:
            return create(name: "openCart", data: [:])
        case let .openCalendar(event):
            return create(
                name: "openCalendar",
                data: [
                    "event": event.asDict()
                ]
            )
        case .close:
            return create(name: "close", data: [:])
        case let .pictureInPictureStateChanged(action):
            return create(
                name: "pictureInPictureStateChanged",
                data: ["action": action.rawValue ?? NSNull()]
            )
        case .playButtonTapped:
            return create(name: "playButtonTapped", data: [:])
        case .pauseButtonTapped:
            return create(name: "pauseButtonTapped", data: [:])
        case let .recievedChatMessages(added, removed):
            return create(
                name: "recievedChatMessages",
                data: [
                    "added":   added.map { $0.asDict() },
                    "removed": removed.map { $0.asDict() },
                ]
            )
        case let .sentChatMessage(message):
            return create(name: "sentChatMessage", data: ["message": message.asDict()])
        case let .productWasHighlighted(product):
            return create(name: "productWasHighlighted", data: ["product": product.asDict()])
        case let .replay(info):
            return create(
                name: "replay",
                data: [
                    "product": info.product?.asDict() ?? NSNull(),
                ]
            )
        @unknown default:
            return nil
        }
    }
    
    private func create(name: String, data: NSDictionary) -> NSDictionary {
        return [
            "event": name,
            "data": data,
        ]
    }
}

extension PlayerPipAction {
    var rawValue: String? {
        switch self {
        case .open:
            return "open"
        case .close:
            return "close"
        case .restore:
            return "restore"
        @unknown default:
            return nil
        }
    }
}
