import React, { Component } from "react";
import { FlatList, Text, View, SafeAreaView, Image, StyleSheet, Dimensions } from "react-native";
import Choice from "./choice";
import StatusBar from './statusBar';
import Music from './music';
const screen = Dimensions.get('window')
export default class Choices extends Component {
  constructor(props) {
    super(props);
    this.state = {
      question: {
        title:"What is the largest planet in solar system?",
        image: '../../images/solarSystem.jpg'
      },
      choices: [
        { id: 1, title: "Sun", color: "#3F6BA9" },
        { id: 2, title: "Jupiter", color: "#5099A4" },
        { id: 3, title: "Earth", color: "#E1AB48" },
        { id: 4, title: "Venus", color: "#C45C6B" },
      ],
      status: {
        currentQuestion: 1,
        totalQuestion: 20
      }
    };
  }
  render() {
    const { question, choices, status } = this.state;
    const image = '../../images/solarSystem.jpg';
    return (
      <SafeAreaView>
        <View style={styles.container}>
          <View style={styles.containerStatusBar}><StatusBar currentQuestion={status.currentQuestion} totalQuestion={status.totalQuestion}/></View>
          <View style={styles.containerQuestion}>
            <Image source={require(image)} style = {styles.image}/>
            <Text style={styles.titleQuestion}>{question.title}</Text>
          </View>
          <View style={styles.containerChoices}>
            {choices.map((choice) => (
              <Choice title={choice.title} color={choice.color} key={JSON.stringify(choice.id)}/>
            ))}
          </View>
          <View style={styles.containerMusic}><Music /></View>
        </View>
      </SafeAreaView>
    );
  }
}
const styles = StyleSheet.create({
  image: {
    height: screen.height*0.2,
    width: screen.width*0.7,
    marginVertical:10
  },
  containerQuestion: {
    justifyContent: "center",
    alignItems: "center",
    width: screen.width*0.8,
    marginBottom:20

  },
  container: {
    justifyContent: "flex-start",
    alignItems: "center",
    backgroundColor: "black",
    alignSelf: "stretch",
    flex: 1,
    width: screen.width,
  },
  titleQuestion: {
    fontSize: 22,
    color: "white",
    textAlign: "center",
    marginVertical: 10
  },
  containerStatusBar: {
    alignSelf: "flex-start",
    paddingLeft: screen.width*0.05,
    paddingTop: 10,
    marginBottom:20
  },
  containerMusic: {
    alignSelf: "flex-start",
    paddingLeft: screen.width*0.05,
    paddingTop: 10
  }
})