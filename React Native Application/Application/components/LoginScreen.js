/* 

    The component file for the login screen. Sets up the
    design and functionality for the login section of
    the application.
    
    AUTHOR: Kane Kennedy

*/

// React Imports

import React, { useState, useEffect } from 'react';
import { View, Text, TextInput, Pressable } from 'react-native';
import { useIsFocused } from '@react-navigation/native';
import theme from './theme.js'
import AsyncStorage from '@react-native-async-storage/async-storage';

const LoginScreen = ({navigation}) => {

  const [data, setData] = useState({
    
    email: "",
    password: ""
  
  });

  // Re-render when required 

  const isFocused = useIsFocused();

  useEffect(() => {
      
    setData({email: "", password: ""})

  }, [isFocused])

  // login Endpoint

  const login = () => {
  
        return fetch("http://localhost:3333/api/1.0.0/login", { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(data)})
  
        .then((response) => {
  
          if (response.status === 200) {
  
            return response.json();
  
          }
  
          else if (response.status === 400) {
  
            Alert.alert("Error: Invalid Email/Password Supplied")
  
          }
  
          else if (response.status === 500) {
  
            Alert.alert("Error: Server Issue")
  
          }
  
          else {
  
            Alert.alert("Unknown Error: Contact Developer")
  
          }
  
        })

        .then ( async (responseJson) => {

          console.log(responseJson);

          await AsyncStorage.setItem('@session_token', responseJson.token);
          await AsyncStorage.setItem('@user_ID', responseJson.id);

          navigation.navigate("Application");

        })
  
        .catch((error) => {
  
          console.log(error);
  
        })

    }

    return (

      <View style = {[theme.mainContainer, {alignItems: "center"}]}>

        <Text style = {[theme.largeTitle, {marginBottom: 25}]}>Spacebook</Text>

        <View>

            <TextInput
            
              style = {[theme.textInput, {marginBottom: 10}]}
              placeholder = "Enter your Email"
              onChangeText = {(email) => setData({...data, email: email})}
              value = {data.email}
              
              />

            <TextInput
            
              style = {theme.textInput}
              placeholder = "Enter your Password"
              secureTextEntry = {true}
              onChangeText = {(password) => setData({...data, password: password})}
              value = {data.password}
            
            />

        </View>

        <View>

            <Pressable style = {[theme.standardButton, {marginBottom: 10}]} onPress = {() => login()}>

                <Text style = {theme.buttonText}>Login</Text>

            </Pressable>

            <Pressable style = {theme.standardButton} onPress = {() => navigation.navigate('Register')}>

                <Text style = {theme.buttonText}>Sign Up</Text>

            </Pressable>

        </View>

      </View>

    );

  };

export default LoginScreen;