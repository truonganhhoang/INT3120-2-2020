import React from 'react';
import { View, StyleSheet, Text, Dimensions, ScrollView } from 'react-native';
import {
    Container,
    Row, Col, Body, Tab, Tabs
} from 'native-base';

import HeaderCommon from '../../components/HeaderCommon';
import TestItem from '../../components/TestItem';

const Examination = ({icon, label, onClick, ...props}) => {
    return (
        <Container>
            <View>
                <HeaderCommon/>
            </View>
            <ScrollView>
                <Row>
                   <TestItem label={"Unit1"}/>
                </Row>
               
            </ScrollView>
        </Container>
    )
}

export default Examination;