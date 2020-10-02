import React, { Component } from 'react';
import { createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import Ionicons from 'react-native-vector-icons/Ionicons';

import HomeQuiz from './components/HomeQuiz';
import Search from './components/Search';
import Activity from './components/Activities/Running';
import Setting from './components/Setting';
import { Dimensions } from 'react-native';

const color = {
    ACTIVE: '#9a4c00',
    INACTIVE: '#414141'
}

const Tab = createBottomTabNavigator();
const screen = Dimensions.get('window');
export default class AppNavigator extends React.Component{
    render() {
    return (
        <Tab.Navigator tabBarOptions={{
        style: {
          position: "absolute",
          bottom: 15,
          height: 65,
          borderRadius: 45,
          marginHorizontal:8,
          shadowColor: "#000",
          shadowOffset: {
              width: 0,
              height: 2,
          },
          shadowOpacity: 0.25,
          shadowRadius: 3.84,
        },
        activeTintColor: '#9a4c00',
        inactiveTintColor: '#414141',
        tabStyle: {
          alignItems: "center",
          paddingVertical: 5
        },
        labelStyle: {
          fontWeight: "bold"
        }}}>
          <Tab.Screen
          name="Home" 
          component={HomeQuiz} 
          options={{tabBarIcon: ({focused}) => {
            return <Ionicons name="ios-home"
            color= {focused? color.ACTIVE: color.INACTIVE}
            size={36} />
          }}} />
          <Tab.Screen 
          name="Search" 
          component={Search} 
          options={{tabBarIcon: ({focused}) => {
            return <Ionicons name="ios-search"
            color= {focused? color.ACTIVE: color.INACTIVE}
            size={36} />
          }}}/>
          <Tab.Screen 
          name="Activity" 
          component={Activity} 
          options={{tabBarIcon: ({focused}) => {
            return <Ionicons name="ios-timer"
            color= {focused? color.ACTIVE: color.INACTIVE}
            size={36} />
          }}}/>
          <Tab.Screen 
          name="Setting" 
          component={Setting} 
          options={{tabBarIcon: ({focused}) => {
            return <Ionicons name="ios-settings"
            color= {focused? color.ACTIVE: color.INACTIVE}
            size={36} />
          }}}/>
        </Tab.Navigator>
    );
  }
  }