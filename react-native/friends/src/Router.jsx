import {
  createStackNavigator,
  createAppContainer,
} from 'react-navigation';

import ProfileScreen from './screens/ProfileScreen';
import ProfileListScreen from './screens/ProfileListScreen';

const AppNavigator = createStackNavigator({
  ProfileList: {
    screen: ProfileListScreen,
  },
  Profile: {
    screen: ProfileScreen,
    path: 'people/:id',
  },
}, {
  initialRouteName: 'ProfileList',
  defaultNavigationOptions: {
    headerStyle: {
      backgroundColor: '#f4511e',
    },
    headerTintColor: '#fff',
    headerTitleStyle: {
      fontWeight: 'bold',
    },
  },
});

export default createAppContainer(AppNavigator);
