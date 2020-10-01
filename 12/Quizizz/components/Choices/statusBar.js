import React, { Component } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons'
export default class StatusBar extends Component {
    render() {
        const {currentQuestion, totalQuestion} = this.props;
        return (
            <View style={styles.container}>
                <TouchableOpacity><View style={styles.containerPause}><Icon name="ios-pause" size={25} color="white"/></View></TouchableOpacity>
        <View style={styles.containerProgress}><Text style={styles.titleProgress}>{currentQuestion}/{totalQuestion}</Text></View>
            </View>
        )
    }
}
const styles = StyleSheet.create({
    container: {
        flexDirection: "row",
        alignItems: "flex-end",
        width: 94,
        justifyContent: "space-between",
    },
    containerProgress: {
        backgroundColor: "#C4C4C4",
        width: 51,
        height: 26,
        borderRadius:5,
        justifyContent: "center",
        alignItems: "center",
    },
    titleProgress: {
        color: "white",
        fontStyle: "normal",
        fontWeight: "bold",
        fontSize: 14,
        lineHeight: 16,
        textAlign: "center"
    },
    containerPause: {
        width: 35,
        height: 35,
        borderRadius: 5,
        backgroundColor: "#c4c4c4",
        alignItems: "center",
        justifyContent: "center"
    },
})