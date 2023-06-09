import BambuserPlayerSDK

extension BambuserPlayerEvent.Product {
     
     func asDict() -> NSDictionary {
        [
            "id": id,
            "productReference": productReference,
            "title": title ?? NSNull(),
            "brandName": brandName ?? NSNull(),
            "thumbnailUrl": thumbnailUrl?.absoluteString ?? NSNull(),
            "publicUrl": publicUrl?.absoluteString ?? NSNull()
        ]
    }
}
