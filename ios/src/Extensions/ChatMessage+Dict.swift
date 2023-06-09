import BambuserPlayerSDK

extension BambuserPlayerEvent.ChatMessage {
     
     func asDict() -> NSDictionary {
        [
            "id": id ?? NSNull(),
            "appearedAt": appearedAt.timeIntervalSince1970,
            "senderId": senderId ?? NSNull(),
            "senderName": senderName,
            "broadcastId": broadcastId ?? NSNull(),
            "message": message,
            "avatarUrl": avatarUrl?.absoluteString ?? NSNull(),
            "client": client.rawValue ?? NSNull(),
        ]
    }
}

extension BambuserPlayerEvent.ChatMessage.ClientType {
    var rawValue: String? {
        switch self {
        case .moderator:
            return "moderator"
        case .host:
            return "host"
        case .shopper:
            return "shopper"
        @unknown default:
            return nil
        }
    }
}
