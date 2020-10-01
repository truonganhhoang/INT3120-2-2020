import React, {Component} from 'react';
import {View, StyleSheet, Text, TouchableOpacity, Dimensions} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

const screen = Dimensions.get('window');

export default class TaskBar extends Component {
    render(){
        return(
            <View style={styles.container}>
                <View style={styles.menuContainer}>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-home" size={32}/>
                        <Text>Home</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-timer" size={32}/>
                        <Text>Activity</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-search" size={32}/>
                        <Text>Search</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.menuBarIcon}>
                        <Ionicons name="ios-settings" size={32}/>
                        <Text>Setting</Text>
                    </TouchableOpacity>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        position: 'absolute',
        bottom: 20,
        backgroundColor: 'transparent',
        width: screen.width,
        alignItems: "center"
    },
    menuContainer: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        height: 60,
        width: 360,
        backgroundColor: 'white',
        borderRadius: 45,
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
        backgroundColor: 'white',
        elevation: 5,
        paddingHorizontal: 30,
    },
    menuBarIcon: {
        alignItems: "center",
    }
})