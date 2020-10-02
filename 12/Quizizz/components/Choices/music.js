import React, { Component } from 'react';
import { View, StyleSheet, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons'
export default class Music extends Component {
    render() {
        return(
            <TouchableOpacity><View style={styles.container}><Icon name="ios-musical-notes" color="black" size={30}/></View></TouchableOpacity>
        )
    }
}
const styles = StyleSheet.create({
    container: {
        backgroundColor: "white",
        borderRadius: 5,
        width: 41,
        height:41,
        justifyContent: "center",
        alignItems: "center"
    }
})