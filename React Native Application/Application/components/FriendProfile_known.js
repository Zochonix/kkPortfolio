/* 

    The component file for the user profile screen. Sets up the
    design and functionality for the main profile screen of
    the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React from 'react';
import { View, Text, Pressable } from 'react-native';
import theme from './theme.js'

const FriendProfile_Known = ({navigation}) => {

    return (

        <View style = {theme.mainContainer}>

            <View style = {{
                
                flex: 3,
                justifyContent: "center",
                alignItems: "center",
                
            }}>

                <Text style = {theme.standardTitle}>Spacebook</Text>

            </View>

            <View style = {{

                flex: 2,
                flexDirection: "row",
                justifyContent: "space-evenly",
                alignItems: "center",

            }}>

                <Text>Photo</Text>

                <View>

                    <NameLabel initialText = "First Name"></NameLabel>
                    <NameLabel initialText = "Last Name"></NameLabel>

                </View>

            </View>

            <View style = {{

                flex: 3,
                flexDirection: "row",
                justifyContent: "space-evenly",
                alignItems: "flex-start",
                flexWrap: "wrap",
                
            }}>

                <SB_Button text = "View Friends" nav = {navigation} screen = 'FriendProfile'></SB_Button>
                <SB_Button text = "View Posts" nav = {navigation} screen = 'Details' margin = {10}></SB_Button>
                <SB_Button text = "Remove Friend"></SB_Button>

            </View>

        </View>

    );

  };

const SB_Button = (props) => {

    return (

        <Pressable style = {[theme.largeButton, {marginBottom: 25}]} onPress = {() => props.nav.navigate(props.screen)}>

            <Text style = {theme.buttonText}>{props.text}</Text>

        </Pressable>

    );

}

const NameLabel = (props) => {

    return (

        // Default

        <Text theme = {theme.standardText}>{props.initialText}</Text>

    );

};

export default FriendProfile_Known;