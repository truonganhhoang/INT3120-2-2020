import React, { Component } from 'react';
import { View, StyleSheet, Text, Button, Dimensions} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons'
import Quiz from '../Quiz'
const screen = Dimensions.get('window');
export default class OverLay extends Component {
    render() {
        return (
            <View style={styles.container}>
                <View style={styles.quiz}><Quiz/></View>
                <View style={styles.containerButton}>
                    <View style={styles.playButton}>
                        <Text style={styles.playTitle}>Let's play</Text>
                        <Icon name="ios-play" color="white" size={30}/>
                        </View>
                    <View style={styles.exitButton}>
                        <Text style={styles.exitTitle}>Exit</Text>
                        </View>
                </View>
            </View>
        )
    }
}
const styles= StyleSheet.create({
    container: {
        width: screen.width*0.8,
        height: screen.height*0.8,
        backgroundColor: "blue",
        justifyContent: "center",
        alignItems: "center",
        borderRadius: 10
    },
    containerButton: {
        flexDirection: "row",
        justifyContent: "flex-start",
        alignItems: "center"
    },
    playButton: {
        width: 162,
        height: 53,
        backgroundColor: "green",
        justifyContent: "space-evenly",
        borderRadius: 10,
        marginHorizontal: 10,
        flexDirection: "row",
        alignItems: "center"
    },
    playTitle: {
        color: "white",
        fontSize: 18,
        lineHeight: 16
    },
    exitButton: {
        width: 69,
        height: 53,
        backgroundColor: "red",
        borderRadius: 10,
        justifyContent: "center",
        alignItems: "center"

    },
    exitTitle: {
        color: "white",
        fontSize: 18,
        lineHeight: 16,
    },
    quiz: {
        alignSelf: "stretch"
    }
})