# bambuserplayersdk-react-native

SDK of Bambusers live video shopping player

## Disclaimer

This project is only an example and does not contain all functionality for iOS and has no implementation for Android.

## Installation

```sh
npm install git+https://github.com/bambuser/bambuserplayersdk-react-native.git

```

## Usage

```js
import { BambuserPlayerView } from 'bambuserplayersdk-react-native';

// ...
<BambuserPlayerView
    showId="vAtJH3xevpYTLnf1oHao" // set your show id
    onPlayerEvent={(event: any) => {
      console.log(`event: ${JSON.stringify(event)}`);
      // process player events 
    }}
    style={ /** add style */ }
  />

```

### iOS 

Please add this code to your `Podfile`:

```diff

require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'
+ require_relative '../node_modules/bambuserplayersdk-react-native/ios/cocoapods/setup'

+ platform :ios, '14.0'

+ use_frameworks! :linkage => :static
+ bambuserplayer_pod_setup self

- platform :ios, min_ios_version_supported
```

And in `ios` directory please run 

```bash 
pod install
```

### Example app

Clone this repository:

```bash 
git clone https://github.com/bambuser/bambuserplayersdk-react-native.git

```

Run this command in the root directory to install all dependencies: 

```bash 
yarn 
```

and open `example/ios/BambuserplayerReactNativeExample.xcworkspace` in Xcode and run the app. 