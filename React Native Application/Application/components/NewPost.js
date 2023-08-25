/* 

    The component file for the new post screen.
    
    Sets up the design and functionality for the new post
    section of the application.

    This section is accessed through the posts tab.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState } from 'react';
import { View, Text, TextInput, Pressable } from 'react-native';
import theme from './theme.js'
import AsyncStorage from '@react-native-async-storage/async-storage';

const NewPost = ({navigation}) => {

    // New Post Endpoint :

    const [data, setData] = useState({

        text:  ""
    
    });

    const makeNewPost = async () => {

        const value = await AsyncStorage.getItem('@session_token');
        const ID = await AsyncStorage.getItem('@user_ID');

        return fetch("http://localhost:3333/api/1.0.0/user/" + ID + "/post", {'headers': {'X-Authorization': value}}, {
  
          method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(data)}
          
        )
  
        .then((response) => {
  
          if (response.status === 201) {

            navigation.popToTop();
  
          }
  
          else if (response.status === 401) {
  
             // Alert.alert("Error: Please Enter Appropriate Data.")
  
          }
  
          else if (response.status === 400) {
  
            //  Alert.alert("Error: Server Issue")
  
          }

          else if (response.status === 500) {
  
           // Alert.alert("Error: Server Issue")

        }
  
          else {
  
            //Alert.alert("Error: Please Contact Support")
  
          }
  
        })
  
        .catch((error) => {
  
          console.log("Error: Please Contact Support")
          navigation.popToTop();
  
        })
  
    }

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

            <TextInput

                name = "text"
                style = {[theme.textInput, {marginBottom: 25, width: "80%", maxWidth: 500, height: 100}]}
                placeholder = "Enter your Message"
                multiline = {true}
                onChangeText = {(text) => setData({...data, text: text})}
                value = {data.text}
                
            />

            <View style = {{

                flexDirection: "row",
                width: "80%",
                justifyContent: "space-evenly",
                alignItems: "space-evenly",

            }}>

                <SB_Button text = "Clear"></SB_Button>
                
                <Pressable style = {theme.standardButton} onPress = {() => makeNewPost()}>

                    <Text style = {theme.buttonText}>Submit</Text>

                </Pressable>

            </View>
            

        </View>

      </View>

    );

  };

  const SB_Button = (props) => {

    return (

        <Pressable style = {theme.standardButton} onPress = {() => makeNewPost()}>

            <Text style = {theme.buttonText}>{props.text}</Text>

        </Pressable>

    );

};

export default NewPost;