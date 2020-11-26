import React, { useEffect, useState, useRef } from 'react';
import { Container, Row, Col, Spinner, TouchableHighlight } from 'native-base';
import { useNavigation, useRoute } from '@react-navigation/native';
import { StyleSheet, View, Text } from 'react-native';
import axios from 'axios';
import { Dimensions } from "react-native";
import Icon from 'react-native-vector-icons/FontAwesome5';
import HeaderPractice from '../../../../components/HeaderPractice';
import ItemVideo from '../../../../components/ItemVideo';
var countInRow = 0,
    tempArr = [];

const Detail = ({ navigation, route }) => {
    const [data, setData] = useState(null);
    useEffect(() => {
        axios
            .get("https://hacknao-api.herokuapp.com/new_words", { params: { q: { unit_id_eq: route.params.id } } })
            .then((res) => {
                setData(res.data);
                setLoading(false);
            })
            .catch((er) => console.log(er.response))
            .finally(() => setLoading(false));
    }, []);

    return (
        <Container>
            <HeaderPractice icon="times" onClick={() => navigation.goBack()} />
            <View style={styles.video_container}>
                <Text style={styles.video_content}>Video content in here!</Text>
            </View>
            <View>
                {
                    !!data && data.data.map(item => {
                        countInRow++;
                        tempArr.push(item);
                        if (countInRow === 2) {
                            (

                                <Row>
                                    {
                                        tempArr.map(temp => {
                                            (
                                                <ItemVideo label={temp.word_en}></ItemVideo>
                                            )
                                        })
                                    }
                                </Row>
                            );
                            countInRow = 0;
                            tempArr.length = 0;
                        }
                    })
                }
            </View>
        </Container>
    )


}
const width = Dimensions.get('screen').width;
const styles = StyleSheet.create({
    video_container: {
        width: width,
        height: 250,
        flex: 1,
        justifyContent: "center"
    },
    video_content: {
        textAlign: "center",
        fontSize: 20
    }
})
export default Detail;