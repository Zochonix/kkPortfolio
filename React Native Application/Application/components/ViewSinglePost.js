/* 

    The component file for the new post screen.
    
    Sets up the design and functionality for the new post
    section of the application.

    This section is accessed through the posts tab.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React from 'react';
import { View, Text, TextInput, Pressable } from 'react-native';
import theme from './theme.js'

const ViewSinglePost = () => {

    return (

      <View style = {theme.mainContainer}>

        <View style = {{

            flex: 2,
            justifyContent: "center",
            alignItems: "center",

        }}>

            <Text style = {theme.standardTitle}>Spacebook</Text>

        </View>

        <View style = {{

            flex: 2,
            justifyContent: "flex-start",
            alignItems: "center",

        }}>

            <TextInput style = {[theme.textInput, {marginBottom: 25, width: "80%", maxWidth: 500, height: 100}]} placeholder = "Like Post" multiline = {true}></TextInput>

            <View style = {{

                flexDirection: "row",
                width: "80%",
                justifyContent: "space-evenly",
                alignItems: "space-evenly",

            }}>

                <Pressable style = {theme.standardButton} onPress = {() => navigation.navigate('Register')}>

                    <Text style = {theme.buttonText}>{props.text}</Text>

                </Pressable>

            </View>
            

        </View>

      </View>

    );

  };

export default ViewSinglePost;