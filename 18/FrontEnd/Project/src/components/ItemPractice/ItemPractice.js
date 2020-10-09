import { Button } from 'native-base';
import React from 'react';
import {Dimensions, Text, StyleSheet, View} from 'react-native';

const ItemPractice = ({icon, label, onClick, ...props}) => {
  return (
    <View style={styles.box_container}>
      <Text style={styles.title_text}>{label}</Text>
      <Button style={styles.button} onPress={onClick} {...props} bordered info>
        <Text> Dễ </Text>
      </Button>
      <Button style={styles.button} onPress={onClick} {...props} bordered info>
        <Text> Khó </Text>
      </Button>
    </View>
    
  )
};
const screen = Dimensions.get('screen');
const styles = StyleSheet.create({
  button: {
    marginTop: 10,
    flexDirection: 'column',
    width: '100%',
    height: 40,
    borderRadius: 15,
    backgroundColor: '#fff'
  },
  box_container: {
    borderRadius: 10,
    padding: 10,
    marginTop: 10,
    width: screen.width * 0.44,
    borderWidth: 0.5,
    borderColor: '#00CDDA',
    justifyContent: 'center'
  },
  title_text: {
    fontSize: 10,
    fontWeight: "bold",
    color: '#00CDDA',
    textAlign: 'center'
  }
})

export default ItemPractice;
