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
      backgroundColor: '#ff9800',
    },
    headerTintColor: '#000',
    headerTitleStyle: {
      fontWeight: 'bold',
    },
  },
});

export default createAppContainer(AppNavigator);
