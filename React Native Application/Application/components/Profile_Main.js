/* 

    The component file for the user profile screen. Sets up the
    design and functionality for the main profile screen of
    the application.
    
    AUTHOR: Kane Kennedy

*/

// Imports

import React, { useState, useEffect } from 'react';
import { View, Text, Pressable, ActivityIndicator, FlatList } from 'react-native';
import theme from './theme.js'
import AsyncStorage from '@react-native-async-storage/async-storage';

const Profile_Main = ({navigation}) => {

    const [userData, setData] = useState([]);
    const [isLoading, setLoading] = useState(true);

    const getUserData = async () => {

        const value = await AsyncStorage.getItem('@session_token');
        const ID = await AsyncStorage.getItem('@user_ID');

        return fetch('http://localhost:3333/api/1.0.0/user/' + ID, {'headers': {'X-Authorization': value}})

        .then((response) => {

            if (response.status === 200) {

                return response.json();

            }
            
            else if (response.status === 401) {

              console.log("Error")

            }
            
            else {

                throw 'Something went wrong';

            }

        })

        .then((responseJson) => {

            setData(responseJson)
            setLoading(false);

        })

        .catch((error) => {

            console.log(error);
        
        })

    }

    useEffect(() => {

        getUserData();

    }, [])

    if (isLoading === true) { return <ActivityIndicator/> }

    else {

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

                        <View style = {{

                            flex: 5,
                            flexDirection: "column",
                            justifyContent: "center",
                            alignItems: "center",
                            backgroundColor: "blue",

                        }}>
    
                            <FlatList
                                
                                data = {userData}
                                renderItem={({item}) => (
                    <View>
                      <Text style = {theme.standardText}>{item.first_name} {item.last_name}</Text>
                    </View>
                )}

                keyExtractor={(item, index) => item.ID.toString()}

              />

                        </View>

                    </View>

                    <View style = {{

                        flex: 3,
                        flexDirection: "row",
                        justifyContent: "space-evenly",
                        alignItems: "flex-start",
                        flexWrap: "wrap",
                        
                    }}>

                        <SB_Button text = "My Friends" nav = {navigation} screen = 'Friends'></SB_Button>
                        <SB_Button text = "Edit Details" nav = {navigation} screen = 'Details' margin = {10}></SB_Button>
                        <SB_Button text = "Change Photo"></SB_Button>
                        <SB_Button text = "Log Out" nav = {navigation} screen = 'LogOut'></SB_Button>

                    </View>

            </View>

        );

    };

};

const SB_Button = (props) => {

    return (

        <Pressable style = {[theme.largeButton, {marginBottom: 25}]} onPress = {() => props.nav.navigate(props.screen)}>

            <Text style = {theme.buttonText}>{props.text}</Text>

        </Pressable>

    );

}

export default Profile_Main;