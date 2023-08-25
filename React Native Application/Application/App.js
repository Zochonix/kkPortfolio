/* 

    The base file for the application.
    
    Sets up the navigators and gets the components.
    
    AUTHOR: Kane Kennedy

*/

// React Imports

import React, { useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';

// Comp Imports

import LoginScreen from './components/LoginScreen.js';
import RegisterScreen from './components/RegisterScreen.js';

import Profile_Main from './components/Profile_Main.js';
import Posts_Main from './components/Posts_Main.js';
import FindFriends_Main from './components/FindFriends_Main.js';
import FriendRequests_Main from './components/FriendRequests_Main.js';

import EditDetails from './components/EditDetails.js';
import LogOut from './components/LogOutScreen.js';

import NewPost from './components/NewPost.js';
import ViewUserPosts from './components/ViewUserPosts.js';

import ViewFriends from './components/ViewFriends.js';
import FriendProfileKnown from './components/FriendProfile_known.js';
import FriendProfileUnknown from './components/FriendProfile_unknown.js';

// Create the Navigator Objects

const rootNav = createNativeStackNavigator();
const profileNav = createNativeStackNavigator();
const postsNav = createNativeStackNavigator();
const viewFriendsNav = createNativeStackNavigator();
const viewPostNav = createNativeStackNavigator();

const appNav = createBottomTabNavigator();

const Root = () => {

    return (

      <NavigationContainer>

        <rootNav.Navigator initialRouteName = "Login" screenOptions = {{headerShown: false}}>

          <rootNav.Screen name = "Application" component = {Profile} />
          <rootNav.Screen name = "Login" component = {LoginScreen} />
          <rootNav.Screen name = "Register" component = {RegisterScreen} />

        </rootNav.Navigator>

      </NavigationContainer>

    );

}

const Profile = () => {

  return (

    <profileNav.Navigator screenOptions = {{headerShown: false}}>

      <profileNav.Screen name = "Stack_Profile" component = {Application}/>
      <profileNav.Screen name = "Friends" component = {ViewFriendsStack}/>
      <profileNav.Screen name = "Details" component = {EditDetails}/>
      <profileNav.Screen name = "LogOut" component = {LogOut}/>

    </profileNav.Navigator>

  );

};

const Application = () => {

  return (

    <appNav.Navigator screenOptions = {{headerShown: false}}>

      <appNav.Screen name = "My Profile" component = {Profile_Main} options = {{tabBarIcon: ({ color, size }) => (<MaterialCommunityIcons name = "account" color = {color} size = {size} />)}}></appNav.Screen>
      <appNav.Screen name = "Posts" component = {Posts} options = {{tabBarIcon: ({ color, size }) => (<MaterialCommunityIcons name = "comment" color = {color} size = {size}/>)}}></appNav.Screen>
      <appNav.Screen name = "Find Friends" component = {FindFriends_Main} options = {{tabBarIcon: ({ color, size }) => (<MaterialCommunityIcons name = "magnify" color = {color} size = {size}/>)}}></appNav.Screen>
      <appNav.Screen name = "Requests" component = {FriendRequests_Main} options = {{tabBarIcon: ({ color, size }) => (<MaterialCommunityIcons name = "account-multiple" color = {color} size = {size}/>)}}></appNav.Screen>

    </appNav.Navigator>

  );

}

const Posts = () => {

  return (

    <postsNav.Navigator screenOptions = {{headerShown: false}}>

      <postsNav.Screen name = "Stack_Posts" component = {Posts_Main}/>
      <postsNav.Screen name = "ViewPost" component = {ViewPostStack}/>
      <postsNav.Screen name = "NewPost" component = {NewPost}/>

    </postsNav.Navigator>

  );

};

const ViewPostStack = () => {

  return (

    <viewPostNav.Navigator screenOptions = {{headerShown: false}}>

      <viewPostNav.Screen name = "Stack_ViewPosts" component = {ViewUserPosts}/>
      <viewPostNav.Screen name = "ViewSinglePost" component = {ViewSinglePost}/>

    </viewPostNav.Navigator>

  );

};

const ViewFriendsStack = () => {

  return (

    <viewFriendsNav.Navigator screenOptions = {{headerShown: false}}>

      <viewFriendsNav.Screen name = "Stack_Friends" component = {ViewFriends}/>
      <viewFriendsNav.Screen name = "FriendProfileKnown" component = {FriendProfileKnown}/>
      <viewFriendsNav.Screen name = "FriendProfileUnknown" component = {FriendProfileUnknown}/>

    </viewFriendsNav.Navigator>

  );

};



export default Root;
