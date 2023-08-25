/* 

    The component file for the friend request screen. Sets up the
    design and functionality for this section of the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState } from 'react';
import { View, Text, FlatList } from 'react-native';
import theme from './theme.js'

const FriendRequests_Main = () => {

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
                justifyContent: "center",
                alignItems: "center",

            }}>

                <FlatList></FlatList>

            </View>

        </View>

    );

  };

export default FriendRequests_Main;