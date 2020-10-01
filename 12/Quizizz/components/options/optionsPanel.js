import React, { Component } from 'react';
import { SafeAreaView, View, StyleSheet, Dimensions } from 'react-native';
import Option from './option'
const screen = Dimensions.get('window');
export default class OptionPanel extends Component {
    render() {
        return (
            <SafeAreaView>
                <View style={styles.container}>
                    <Option title="Setting"/>
                </View>
            </SafeAreaView>
        )
    }
}
const styles = StyleSheet.create({
    container: {
        height: screen.height*0.12,
        width: screen.width*0.35,
        backgroundColor: 'white',
        borderRadius: 10,
        shadowColor: "rgba(0,0,0,0.5)",
        shadowOffset: {
            width: 2,
            height: 3,
        },
        shadowOpacity: 0.8,
        shadowRadius: 4,
        alignItems: "center",
        paddingTop:10
        },
})