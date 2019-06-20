import React, { PureComponent } from 'react';
import {
  View,
  Text,
  Image,
  StyleSheet,
} from 'react-native';
import PropTypes from 'prop-types';

const styles = StyleSheet.create({
  profileText: {
    fontSize: 20,
    color: '#ff9800',
  },
});

class ProfileScreen extends PureComponent {
  static propTypes = {
    navigation: PropTypes.shape({
      navigate: PropTypes.func.isRequired,
      state: PropTypes.shape({
        params: PropTypes.shape({
          name: PropTypes.shape({
            first: PropTypes.string.isRequired,
            last: PropTypes.string.isRequired,
          }),
          login: PropTypes.shape({
            username: PropTypes.string.isRequired,
          }),
          email: PropTypes.string.isRequired,
          dob: PropTypes.shape({
            age: PropTypes.number.isRequired,
          }),
          cell: PropTypes.string.isRequired,
          picture: PropTypes.shape({
            large: PropTypes.string.isRequired,
          }),
        }),
      }),
    }).isRequired,
  }

  static navigationOptions = ({ navigation }) => {
    return {
      title: `${this.upperFirst(navigation.state.params.name.first)}'s profile`,
    };
  };

  static upperFirst = str => str[0].toUpperCase() + str.substring(1);

  render() {
    const {
      navigation: {
        state: {
          params: friend,
        },
      },
    } = this.props;

    return (
      <View>
        <View
          style={{
            justifyContent: 'center',
            alignItems: 'center',
          }}
        >
          <Image
            style={{
              width: 200,
              height: 200,
              borderRadius: 100,
            }}
            source={{
              uri: friend.picture.large,
            }}
          />
        </View>
        <View
          style={{
            paddingLeft: 20,
            paddingRight: 5,
          }}
        >
          <Text style={styles.profileText}>{`First name: ${ProfileScreen.upperFirst(friend.name.first)}`}</Text>
          <Text style={styles.profileText}>{`Last name: ${ProfileScreen.upperFirst(friend.name.last)}`}</Text>
          <Text style={styles.profileText}>{`Username: ${friend.login.username}`}</Text>
          <Text style={styles.profileText}>{`Email: ${friend.email}`}</Text>
          <Text style={styles.profileText}>{`Age: ${friend.dob.age}`}</Text>
          <Text style={styles.profileText}>{`Cell: ${friend.cell}`}</Text>
        </View>
      </View>
    );
  }
}

export default ProfileScreen;
