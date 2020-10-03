import React, { Component } from "react";
import {
  View,
  Platform,
  StyleSheet,
  Text,
  TouchableOpacity,
  StatusBar
} from "react-native";
import { Fontisto, MaterialIcons } from "@expo/vector-icons";

export default class StatusTab extends Component {
  render() {
    return (
      <View style={styles.statusTab}>
        <StatusBar backgroundColor= "black" barStyle="dark-content"/>
        <TouchableOpacity style={styles.statusContainer}>
          <View style={styles.runningContainer}>
          <MaterialIcons name="hourglass-empty" size={18}></MaterialIcons>
          <Text style={{ fontSize: 16 }}>Running</Text>
          </View>
          <View ></View>
        </TouchableOpacity>
        <TouchableOpacity style={styles.statusContainer}>
          <View style={styles.completedContainer}>
          <MaterialIcons name="hourglass-full" size={18}></MaterialIcons>
          <Text style={{ fontSize: 16 }}>Completed</Text>
          </View>
          <View style={styles.active}></View>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  statusTab: {
    flexDirection: "row",
    height: 40,
    justifyContent: "flex-start",
  },
  runningContainer: {
    flexDirection: "column",
    flexDirection: "row",
    width: 125,
    alignItems: "center",
    justifyContent: "center",
  },
  completedContainer: {
    flexDirection: "row",
    width: 125,
    alignItems: "center",
    justifyContent: "center",
  },
  active: {
    backgroundColor: "#F08018",
    width: 125,
    height: 5
  },
  statusContainer: {
    marginHorizontal: 10,
    justifyContent: "space-evenly"
  }
});
