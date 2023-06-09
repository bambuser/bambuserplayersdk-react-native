#import <React/RCTLog.h>

#import "Logger.h"

void ReactLogWarn(NSString *msg) {
  RCTLogWarn(@"%@", msg);
}

void ReactLogError(NSString *msg) {
  RCTLogError(@"%@", msg);
}

void ReactLog(NSString *msg) {
  RCTLog(@"%@", msg);
}