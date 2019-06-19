import {
  createStackNavigator,
  createAppContainer,
} from 'react-navigation';

import ProfileScreen from './screens/ProfileScreen';

const AppNavigator = createStackNavigator({
  Profile: {
    screen: ProfileScreen,
    path: 'people/:id',
  },
}, {
  initialRouteName: 'Profile',
});

export default createAppContainer(AppNavigator);
