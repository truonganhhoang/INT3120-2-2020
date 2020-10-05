import * as React from 'react';
import { Text, View } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Icon from 'react-native-vector-icons/FontAwesome5';

import Home from '../screens/Home';
import Media from '../screens/Media';
import Test from '../screens/Examination';
import Examination from '../screens/Examination';



function Practice() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Media!</Text>
    </View>
  );
}

function Option() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Media!</Text>
    </View>
  );
}

const Tab = createBottomTabNavigator();

export default function MainStack() {
  return (
    <NavigationContainer>
      <Tab.Navigator
        screenOptions={({ route }) => ({
          tabBarIcon: ({ focused, color, size }) => {
            let iconName;

            if (route.name === 'Trang chủ') {
              iconName = 'home';
            } else if (route.name === 'Audio') {
              iconName = 'headphones';
            } else if (route.name === 'Kiểm tra') {
              iconName = 'file-alt';
            } else if (route.name === 'Luyện Tập') {
              iconName = 'book-open';
            } else if (route.name === 'Danh mục') {
              iconName = 'list';
            }

            // You can return any component that you like here!
            return <Icon name={iconName} size={size} color={color} />;
          },
        })}
        tabBarOptions={{
          activeTintColor: '#00CDDA',
          inactiveTintColor: 'gray',
        }}
      >
        <Tab.Screen name="Trang chủ" component={Home} />
        <Tab.Screen name="Audio" component={Media} />
        <Tab.Screen name="Kiểm tra" component={Examination} />
        <Tab.Screen name="Luyện Tập" component={Practice} />
        <Tab.Screen name="Danh mục" component={Option} />
      </Tab.Navigator>
    </NavigationContainer>
  );
}
