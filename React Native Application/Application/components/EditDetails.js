/* 

    The component file for the edit details screen.
    
    Sets up the design and functionality for the edit details
    section of the application.

    This section is accessed through the main profile page.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState } from 'react';
import { View, Text, TextInput, Pressable } from 'react-native';
import theme from './theme.js'
import AsyncStorage from '@react-native-async-storage/async-storage';

const EditDetails = ({navigation}) => {

    const [data, setData] = useState({

        first_name:  "",
        last_name: "",
        email: "",
        password: ""
    
    });

    const changeUserDetails = async () => {

        const value = await AsyncStorage.getItem('@session_token');
        const ID = await AsyncStorage.getItem('@user_ID');

        // editDetails end point.

        return fetch("http://localhost:3333/api/1.0.0/user/" + ID, {'headers': {'X-Authorization': value}}, {
  
          method: 'PATCH', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(data)}
          
        )
  
        .then((response) => {
  
          if (response.status === 200) {
  
            navigation.popToTop();
  
          }
  
          else if (response.status === 400) {
  
              Alert.alert("Error: Please Enter Appropriate Data.")
  
          }
  
          else if (response.status === 401) {
  
              Alert.alert("Error: Unauthorised")
  
          }
  
          else {
  
            Alert.alert("Unknown Error")
  
          }
  
        })
  
        .catch((error) => {
  
          console.log(error);
  
        })
  
    }

    return (

      <View style = {theme.mainContainer}>

        <View style = {{

            flex: 1,
            justifyContent: "center",
            alignItems: "center",

        }}>

            <Text style = {theme.largeTitle}>Spacebook</Text>

        </View>

        <View style = {{

            flex: 2,
            justifyContent: "center",
            alignItems: "center",

        }}>

        <TextInput

            name = "first_name"
            style = {[theme.textInput, {marginBottom: 10}]}
            placeholder = "Enter your First Name"
            onChangeText = {(first_name) => setData({...data, first_name: first_name})}
            value = {data.first_name}

        />

        <TextInput

            name = "second_name"
            style = {[theme.textInput, {marginBottom: 10}]}
            placeholder = "Enter your Second Name"
            onChangeText = {(last_name) => setData({...data, last_name: last_name})}
            value = {data.second_name}

        />

        <TextInput

            name = "email"
            style = {[theme.textInput, {marginBottom: 10}]}
            placeholder = "Enter your Email"
            onChangeText = {(email) => setData({...data, email: email})}
            value = {data.email}

        />

        <TextInput

            name = "password"
            style = {[theme.textInput, {marginBottom: 10}]}
            secureTextEntry = {true}
            placeholder = "Enter your Password"
            onChangeText = {(password) => setData({...data, password: password})}
            value = {data.password}

        />

        </View>

        <View style = {{

            flex: 1,
            justifyContent: "center",
            alignItems: "center",

        }}>

            <Pressable style = {theme.standardButton} onPress = {() => changeUserDetails()}>

                <Text style = {theme.buttonText}>Submit</Text>

            </Pressable>

        </View>

      </View>

    );

};

export default EditDetails;