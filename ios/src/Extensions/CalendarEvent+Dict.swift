import BambuserPlayerSDK

extension CalendarEvent {
    func asDict() -> NSDictionary {
        [
            "title": title,
            "startDate": startDate.timeIntervalSince1970,
            "endDate": endDate.timeIntervalSince1970,
            "url": url.absoluteString,
        ]
    }
}