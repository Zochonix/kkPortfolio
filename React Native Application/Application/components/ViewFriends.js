/* 

    The component file for the view friends screen. Sets up the
    design and functionality for this section of the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState, useEffect } from 'react';
import { View, Text, FlatList } from 'react-native';
import theme from './theme.js';
import AsyncStorage from '@react-native-async-storage/async-storage';

const ViewFriends = async () => {

    const value = await AsyncStorage.getItem('@session_token');
    const ID = await AsyncStorage.getItem('@user_ID');

    const [friendList, setFriendList] = useState([]);

    const getFriendList = async () => {

        try {

            const response = await fetch('http://localhost:3333/api/1.0.0/user/' + ID + "/friends", {'headers': {'X-Authorization': value}})
            const json = await response.json();
            setFriendList(json);
         
       } catch (error) {

         console.error(error);

       } 
       
     }

    useEffect(() => {

        getFriendList();

    }, [])

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

                flex: 2,
                justifyContent: "space-evenly",
                alignItems: "center",

            }}>

            <FlatList

                data = {friendList}
                keyExtractor = {({ id }, index) => id}
                renderItem = {({ item }) => (<Text>{item.first_name}, {item.last_name}</Text>)}

            />

            </View>

        </View>

    );

  };

export default ViewFriends;