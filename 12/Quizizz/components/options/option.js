import React, { Component } from 'react';
import { Text, View, StyleSheet } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons'
export default class Option extends Component {
    render() {
        const {title} = this.props;
        return (
            <View style={styles.container}><Icon name='ios-settings' size={23} />
                    <Text style={styles.title}>{title}</Text>
                </View>
        )
    }
}
const styles = StyleSheet.create({
    container: {
        flexDirection: "row",
        justifyContent: "center",
        alignItems: "center"
    },
    title: {
        fontStyle: "normal",
        fontSize: 18,
        lineHeight:20,
        textAlign: "center",
        marginLeft:10
    }
})