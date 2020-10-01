import React, { Component } from "react";
import {
  View,
  Platform,
  StyleSheet,
  Text,
  TouchableOpacity,
} from "react-native";
import { Fontisto, MaterialIcons } from "@expo/vector-icons";

export default class StatusTab extends Component {
  render() {
    return (
      <View style={styles.statusTab}>
        <TouchableOpacity style={styles.runningContainer}>
          <MaterialIcons name="hourglass-empty" size={18}></MaterialIcons>
          <Text style={{ fontSize: 16 }}>Running</Text>
          <View style={styles.active}></View>
        </TouchableOpacity>
        <TouchableOpacity style={styles.completedContainer}>
          <MaterialIcons name="hourglass-full" size={18}></MaterialIcons>
          <Text style={{ fontSize: 16 }}>Completed</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  statusTab: {
    flexDirection: "row",
    height: 40,
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
  active: {},
});
