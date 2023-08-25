/* 

    The component file for the register screen. Sets up the
    design and functionality for the sign up section of
    the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState } from 'react';
import { View, Text, TextInput, Pressable } from 'react-native';
import { Alert } from 'react-native-web';

import theme from './theme.js'

const RegisterScreen = ({navigation}) => {

  // addUser Endpoint :

  const [data, setData] = useState({

    first_name:  "",
    last_name: "",
    email: "",
    password: ""

  });

    const makeNewUser = () => {

      return fetch("http://localhost:3333/api/1.0.0/user", {

        method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(data)}
        
      )

      .then((response) => {

        if (response.status === 201) {

          Alert.alert("Welcome to Spacebook!")
          navigation.popToTop();

        }

        else if (response.status === 400) {

	        Alert.alert("Error: Please Enter Appropriate Data.")

        }

        else if (response.status === 500) {

	        Alert.alert("Error: Server Issue")

        }

        else {

          Alert.alert("Error: Please Contact Support")

        }

      })

      .catch((error) => {

        Alert.alert("Error: Please Contact Support")
        navigation.popToTop();

      })

  }

    return (

      <View style = {theme.mainContainer}>

        <View style = {{

          flex: 3,
          justifyContent: "center",
          alignItems: "center",

        }}>

          <Text style = {[theme.largeTitle, {marginBottom: 25}]}>Spacebook</Text>

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

          flex: 3,
          justifyContent: "center",
          alignItems: "center",

        }}>

            <Pressable style = {theme.standardButton} onPress = {() => makeNewUser()}>

                <Text style = {theme.buttonText}>Register</Text>

            </Pressable>

        </View>

      </View>

    );

  };

export default RegisterScreen;