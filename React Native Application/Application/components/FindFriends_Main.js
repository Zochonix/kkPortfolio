/* 

    The component file for the friend search screen. Sets up the
    design and functionality for this section of
    the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState } from 'react';
import { View, TextInput, Text, Pressable, Switch } from 'react-native';
import theme from './theme.js'

const FindFriends_Main = () => {

    const [switchValue, setSwitchValue] = useState(false);

    const toggleSwitch = (value) => { setSwitchValue(value) };

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
                justifyContent: "space-evenly",
                alignItems: "center",

            }}>
            
                <TextInput style = {theme.textInput} placeholder = "First Name"></TextInput>
                <TextInput style = {theme.textInput} placeholder = "Last Name"></TextInput>

                <View style = {{

                    width: "60%",
                    maxWidth: 300,
                    justifyContent: "space-evenly",
                    alignItems: "center",
                    flexDirection: "row",

                }}>

                    <Switch value = {switchValue} onValueChange = {toggleSwitch}/>
                    <Text>Only Search my Friend List</Text>

                </View>

            </View>

            <View style = {{

                flex: 3,
                justifyContent: "center",
                alignItems: "center",

            }}>

                <SB_Button text = "Search"></SB_Button>

            </View>

        </View>

    );

  };

const SB_Button = (props) => {

    return (

        <Pressable style = {theme.largeButton}>

            <Text style = {theme.buttonText}>{props.text}</Text>

        </Pressable>

    );

};

export default FindFriends_Main;