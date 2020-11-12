import React from 'react';
import { View, Text } from 'react-native';
import { createStackNavigator } from '@react-navigation/stack';

import BottomTabs from './BottomTabs';
import ExamUnit from '../components/ItemExam/ExamUnit/ExamUnit'
import Detail from '../screens/Media/AudioScreen/AudioDetail';

const Stack = createStackNavigator();

function VideoUnit() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Video Unit!</Text>
    </View>
  );
}

export default function MainStack() {
  return (
    <Stack.Navigator initialRouteName={BottomTabs}>
      <Stack.Screen name="Home" options={{ headerShown: false }} component={BottomTabs} />
      <Stack.Screen name="Audio Unit" options={{ headerShown: false }} component={Detail} />
      <Stack.Screen name="Video Unit" options={{ headerShown: false }} component={VideoUnit} />
      <Stack.Screen name="Exam Unit" options={{ headerShown: false }} component={ExamUnit} />
    </Stack.Navigator>
  );
}
