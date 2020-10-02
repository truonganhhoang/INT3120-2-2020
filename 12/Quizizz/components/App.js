import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { NavigationContainer} from '@react-navigation/native';

import AppNavigator from './AppNavigator';
import Choices from './components/Choices/choices';
import OptionsPanel from './components/options/optionsPanel';
import OverLay from './components/overlay/overlay';
import Home from './components/HomeQuiz'
import Search from './components/Search'
import Activity from './components/Activities/Running'
export default function App() {
  return (
    <NavigationContainer>
      <AppNavigator/>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
