import React, { Component } from "react";
import { View, StyleSheet, Text, Image } from "react-native";

export default class Quiz extends Component {
    constructor(props){
        super(props);
        this.state = {
            tabActived: ''
        }
    }
  render() {
    return (
      <View style={styles.quizContainer}>
        <View style={styles.quiz}>
          <View style={styles.imageQuizContainer}>
            <Image
              style={styles.imageQuiz}
              source={require("../images/solarSystem.jpg")}
            ></Image>
          </View>
          <View style={styles.amountOfQuestion}>
            <Text>20Qs</Text>
          </View>
          <Text style={styles.titleQuiz}>Solar System</Text>
          <View style={styles.containerQuestionLeft}>
            <View style={styles.totalQuestion}>
              <View style={styles.leftQuestion}></View>
              <Text style={styles.textQuestionLeft}>19 Question left</Text>
            </View>
          </View>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  quizContainer: {
    marginLeft: 10,
    marginBottom: 10,
  },
  quiz: {
    width: 166,
    height: 166,
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    backgroundColor: "white",
    elevation: 4,
    borderRadius: 10,
    borderColor: "#E5E5E5",
  },
  imageQuizContainer: {
    height: 90,
    borderTopLeftRadius: 10,
    borderTopRightRadius: 10,
    overflow: "hidden",
  },
  amountOfQuestion: {
    width: 41,
    height: 21,
    backgroundColor: "white",
    borderColor: "#E5E5E5",
    marginLeft: 10,
    borderRadius: 5,
    borderWidth: 1,
    marginTop: -10,
  },
  titleQuiz: {
    marginLeft: 10,
    marginTop: 20,
    fontSize: 16,
  },
  imageQuiz: {
    width: 150,
    height: 90,
    borderBottomLeftRadius: 100,
    borderBottomRightRadius: 100,
    transform: [{ scaleX: 2 }],
  },
  containerQuestionLeft: {
    alignItems: "center"
  },
  totalQuestion: {
    backgroundColor: "#D5C9E3",
    width: 143,
    height: 17,
    borderRadius: 10,
    position: 'relative'
  },
  leftQuestion: {
    height: 17,
    width: 50,
    backgroundColor: '#744EA7',
    borderRadius: 10,
  },
  textQuestionLeft: {
    position: 'absolute',
    color: 'white',
    alignSelf: 'center'
  }
});
