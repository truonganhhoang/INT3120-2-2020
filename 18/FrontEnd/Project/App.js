import React from 'react';
import { StyleSheet, Text, View, StatusBar } from 'react-native';
import 'react-native-gesture-handler';
import { NavigationContainer } from '@react-navigation/native';

import MainStack from './src/navigations/MainStack';

export default function App() {
  return (
    // <View style={styles.container}>

    //   <Home/>
    //   <StatusBar style="auto" />
    // </View>
    // <NavigationContainer>
			<MainStack />
		// </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F3F3F3',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
