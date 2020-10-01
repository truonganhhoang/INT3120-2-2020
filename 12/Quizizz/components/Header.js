import React, { Component } from 'react';
import {View, StyleSheet, Dimensions, Text, TouchableOpacity, Image} from 'react-native';

const screen = Dimensions.get('window');

export default class Header extends Component{
    render(){
        const {nameTab} = this.props;
        return(
            <View style={styles.header}>
                <Text style={styles.nameTab}>{nameTab}</Text>
                <TouchableOpacity style={styles.menu}>
                    <View style={styles.menuButton}>
                        <Image source={require('../images/menu-button.png')}
                                            style={{width: 20, height: 20}}></Image>
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
        position: "relative"
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
