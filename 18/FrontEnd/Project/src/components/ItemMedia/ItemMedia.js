import { Button } from 'native-base';
import React from 'react';
import {Dimensions, Text, StyleSheet} from 'react-native';

const ItemMedia = ({icon, label, onClick, ...props}) => {
  return (
    <Button style={styles.container} onPress={onClick} {...props} bordered info>
      <Text style={styles.text}>{label}</Text>
    </Button>
  )
};
const screen = Dimensions.get('screen');
const styles = StyleSheet.create({
  container: {
    marginTop: 10,
    flexDirection: 'column',
    width: screen.width * 0.42,
    height: 50,
    borderRadius: 15,
    backgroundColor: '#fff'
  },
  text: {
    fontSize: 10,
    fontWeight: "bold",
    color: '#00CDDA',
  }
})

export default ItemMedia;
