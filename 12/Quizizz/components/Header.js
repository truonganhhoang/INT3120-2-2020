import React, { Component } from 'react';
import {View, StyleSheet, Dimensions, Text, TouchableOpacity, Image} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons'
const screen = Dimensions.get('window');

export default class Header extends Component{
    render(){
        const {nameTab} = this.props;
        return(
            <View style={styles.header}>
                <Text style={styles.nameTab}>{nameTab}</Text>
                <TouchableOpacity style={styles.menu}>
                    <View style={styles.menuButton}>
                        <Icon name="ios-menu" size={20} />
                    </View>
                </TouchableOpacity>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    header: {
        width: screen.width,
        height: 66,
        flexDirection: 'row',
        position: "fixed"
    },
    nameTab: {
        fontSize: 30,
        fontWeight: 'bold',
        position: 'absolute',
        marginLeft: 12,
        top: 10
    },
    menu:{
        marginRight: 12,
        position: 'absolute',
        right:10,
        top: 10
    },
});
