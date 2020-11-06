import React from 'react';
import { View, Text } from 'react-native';
import { createStackNavigator } from '@react-navigation/stack';
import { Container } from 'native-base';
import { useNavigation } from '@react-navigation/native';

import BottomTabs from './BottomTabs';
import HeaderPractice from '../components/HeaderPractice';
import ExamUnit from '../components/ItemExam/ExamUnit/ExamUnit'

const Stack = createStackNavigator();

function AudioUnit() {
  const navigation = useNavigation();
  return (
    <Container>
      <HeaderPractice icon="times" label="Việt - Anh" onClick={() => navigation.goBack()} />

      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text>Audio Unit!</Text>
      </View>
    </Container>
  );
}

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
      <Stack.Screen name="Audio Unit" options={{ headerShown: false }} component={AudioUnit} />
      <Stack.Screen name="Video Unit" options={{ headerShown: false }} component={VideoUnit} />
      <Stack.Screen name="Exam Unit" options={{ headerShown: false }} component={ExamUnit} />
    </Stack.Navigator>
  );
}
