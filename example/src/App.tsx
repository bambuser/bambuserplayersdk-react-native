import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { BambuserPlayerView } from 'bambuserplayersdk-react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <BambuserPlayerView
        showId="vAtJH3xevpYTLnf1oHao"
        onPlayerEvent={(event: any) => {
          console.log(`received event: ${JSON.stringify(event)}`);
        }}
        style={styles.player}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  player: {
    width: '100%',
    height: '100%',
  },
});
