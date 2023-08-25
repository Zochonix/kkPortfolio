/* 

    The component file for the user profile screen. Sets up the
    design and functionality for the main profile screen of
    the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState, useEffect } from 'react';
import { Text, Pressable, View } from "react-native";
import theme from './theme.js'
import AsyncStorage from '@react-native-async-storage/async-storage';

const LogOut = ({navigation}) => {

    // Log Out Endpoint :

    const [sessionData, setData] = useState({

        token:  "",

    });

    useEffect(() => {
      
        const checkLogOnMount = navigation.addListener('focus', () => {

            checkStatus();

        });

        return checkLogOnMount

    }, [])

    const checkStatus = async () => {

        const sessionToken = await AsyncStorage.getItem('@session_token');

            if (sessionToken !== null) {

                setData({token:sessionToken});

            }
            
            else {

                navigation.popToTop();

            }

    }

    // Server Code

    const logout = async () => {

        const sessionToken = await AsyncStorage.getItem('@session_token');

        await AsyncStorage.removeItem('@session_token');

        return fetch("http://localhost:3333/api/1.0.0/logout", {

            method: 'POST',
            headers: {"X-Authorization": sessionToken}

        })

        .then((response) => {

            if (response.status === 200){

                navigation.popToTop();
                navigation.goBack();

            }
            
            else if (response.status === 401) {

                navigation.popToTop();

            }
            
            else {

                throw 'Something went wrong';

            }

        })

        .catch((error) => {

            console.log(error);

        })

    }

    // Rendering

    return (

        <View style = {theme.mainContainer}>

            <View style = {{
                
                flex: 1,
                justifyContent: "center",
                alignItems: "center",
                
            }}>

                <Text style = {theme.standardTitle}>Spacebook</Text>

            </View>

            <View style = {{

                flex: 1,
                justifyContent: "flex-start",
                alignItems: "center",

            }}>

                <Text style = {{marginBottom: 25}}>Are you sure you want to log out?</Text>

                <Pressable style = {[theme.largeButton, {marginBottom: 10}]} onPress = {() => logout()}>

                    <Text style = {theme.buttonText}>Yes</Text>

                </Pressable>

                <Pressable style = {theme.largeButton} onPress = {() => navigation.goBack()}>

                    <Text style = {theme.buttonText}>No</Text>

                </Pressable>

            </View>

        </View>

    );

  };

export default LogOut;