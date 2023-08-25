/* 

    The component file for the posts screen. Sets up the
    design and functionality for the posts section of the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React from 'react';
import { View, Text, Pressable } from 'react-native';
import theme from './theme.js'

const Posts_Main = ({navigation}) => {

    return (

        <View style = {theme.mainContainer}>

            <View style = {{
                
                flex: 4,
                justifyContent: "center",
                alignItems: "center",
                
            }}>

                <Text style = {theme.standardTitle}>Spacebook</Text>

            </View>

            <View style = {{
                
                flex: 4,
                flexDirection: "column",
                justifyContent: "flex-start",
                alignItems: "center",
                
            }}>

                <SB_Button text = "View my Posts"></SB_Button>
                <SB_Button text = "Make a New Post" nav = {navigation} screen = 'NewPost'></SB_Button>

            </View>

        </View>

    );

};

const SB_Button = (props) => {

    return (

        <Pressable style = {[theme.extraLargeButton, {marginTop: 10}]} onPress = {() => props.nav.navigate(props.screen)}>

            <Text style = {theme.buttonText}>{props.text}</Text>

        </Pressable>

    );

};

export default Posts_Main;