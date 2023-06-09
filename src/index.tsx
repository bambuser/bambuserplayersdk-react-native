import * as React from 'react';
import {
  requireNativeComponent,
  UIManager,
  Platform,
  StyleSheet,
  View,
  Text
} from 'react-native';

const LINKING_ERROR =
  `The package 'bambuserplayersdk-react-native' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type BambuserPlayerViewProps = {
  showId: string,
  onPlayerEvent?: (event: Map<string, any>) => void,
  style?: any,
};

type BambuserPlayerViewState = {};

function AndroidPlaceholderView() {
  return (
    <View style={styles.placeholder}>
      <Text style={styles.warning}>
        Native view for Android isn't implemented yet.
        We'll add this soon in a future release.
      </Text>
    </View>
  );
}

const ComponentName = 'BambuserPlayerView';

const PlayerView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<any>(ComponentName)
    : AndroidPlaceholderView;

class BambuserPlayerView extends React.Component<BambuserPlayerViewProps, BambuserPlayerViewState> {

  constructor(props: BambuserPlayerViewProps) {
    super(props);

    this.state = {};
  }

  render() {
    return (
      <PlayerView
        style={this.props.style}
        showId={this.props.showId}
        onPlayerEvent={(event: any) => {
          this.props.onPlayerEvent?.(event.nativeEvent);
        }}
      />
    );
  }
}

const styles = StyleSheet.create({
  placeholder: {
    flex: 1,
    justifyContent: 'center',
  },
  warning: {
    textAlign: 'center',
    padding: 20,
  },
});

export {
  BambuserPlayerView
};