import React, { Component } from "react";
import {
  Text,
  View,
  TextInput,
  Button,
  SafeAreaView,
  StyleSheet,
  Image,
  TouchableOpacity,
  TouchableWithoutFeedback,Keyboard
} from "react-native";
import { YellowBox } from "react-native";
import Header from "./Header";
import TaskBar from "./TaskBar";
import { MaterialCommunityIcons } from "@expo/vector-icons";
YellowBox.ignoreWarnings(["Remote debugger"]);

export default class Search extends Component {
  constructor(props) {
    super(props);
    this.state = {
      nameTab: "Search",
    };
  }
  render() {
    return (
      <SafeAreaView>
        <TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
          <View style={styles.container}>
            <Header nameTab={this.state.nameTab}></Header>
            <TextInput
              style={styles.input}
              placeholderTextColor="#D3D3D3"
              placeholder="Search for quizzes"
            ></TextInput>
            <View style={styles.filterContainer}>
              <TouchableOpacity style={styles.filter}>
                <MaterialCommunityIcons
                  name="filter"
                  color="#A00CD4"
                  size={18}
                ></MaterialCommunityIcons>
                <Text style={{ fontSize: 13 }}>Filter</Text>
              </TouchableOpacity>
            </View>
          </View>
        </TouchableWithoutFeedback>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    width: "100%",
    height: "100%",
    flexDirection: "column",
  },
  input: {
    marginHorizontal: 15,
    height: 50,
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    backgroundColor: "white",
    elevation: 2,
    borderRadius: 5,
    borderColor: "white",
    paddingLeft: 20,
    fontSize: 18,
  },
  filterContainer: {
    alignItems: "flex-end",
  },
  filter: {
    backgroundColor: "#ffffff",
    width: 71,
    height: 26,
    borderRadius: 20,
    borderColor: "#CCCCCC",
    marginTop: 10,
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    marginRight: 20,
    borderWidth: 2,
  },
});
