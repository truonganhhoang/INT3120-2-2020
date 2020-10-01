import React, { Component } from "react";
import { Text, View, StyleSheet, TouchableOpacity, Dimensions } from "react-native";
const screen = Dimensions.get('window');
export default class Choice extends Component {
  render() {
    const { title, color } = this.props;
    return (
      <TouchableOpacity activeOpacity={0.4}>
        <View style={[styles.containerChoice, { backgroundColor: color }]}>
          <Text style={styles.title}>{title}</Text>
        </View>
      </TouchableOpacity>
    );
  }
}
const styles = StyleSheet.create({
  containerChoice: {
    width: screen.width*0.9,
    height: 72,
    borderRadius: 15,
    marginBottom: 10,
    alignItems: "center",
    justifyContent: "center",
  },
  title: {
    fontSize: 22,
    color: "white",
  },
});
