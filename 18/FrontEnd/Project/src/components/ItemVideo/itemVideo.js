import { Button, Icon } from 'native-base';
import React from 'react';
import { Dimensions, Text, StyleSheet, View } from 'react-native';

const ItemVideo = ({ icon, label, onClick, ...props }) => {
    return (
        <View style={styles.video_item}>
            <View style={styles.icon_video_container}>
                <Text>{label}</Text>
                <Icon name='micro'></Icon>
            </View>
        </View>
    )
}
const styles = StyleSheet.create({
    video_item: {
        width: "40%",
        height: 24,
        borderWidth: 1,
        borderColor: "#c0c0c0",
        shadowColor: "black",
        position: "relative",
        paddingLeft: 8
    },
    icon_video_container: {
        position: "absolute",
        right: 0,
        height: "100%",
        width: 30,
        borderTopRightRadius: '50%',
        backgroundColor: '#00CDDA',
        alignItems: "center"
    }
})
export default ItemVideo;