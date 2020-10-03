import React from 'react'
import { View, StyleSheet, Text, Dimensions, ScrollView } from 'react-native';
import {
    Container,
    Row, Col, Body, Tab, Tabs
} from 'native-base';
import HeaderCommon from 'components/HeaderCommon';
import ItemTest from 'components/TestItem'
const Test = () => {
    return (
        <Container style={styles.body}>
            <View style={styles.header}>
                <HeaderCommon></HeaderCommon>
            </View>
            <ScrollView>
                <Row>
                    <ItemTest>

                    </ItemTest>
                    <ItemTest>
                        
                    </ItemTest>
                </Row>
                <Row>
                    <ItemTest>

                    </ItemTest>
                    <ItemTest>
                        
                    </ItemTest>
                </Row>
                <Row>
                    <ItemTest>

                    </ItemTest>
                    <ItemTest>
                        
                    </ItemTest>
                </Row>
            </ScrollView>
        </Container>
    )
}

export default Test;