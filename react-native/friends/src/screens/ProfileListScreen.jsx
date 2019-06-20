import React, { PureComponent } from 'react';
import {
  View,
  Text,
  Image,
  FlatList,
  TouchableOpacity,
  StatusBar,
} from 'react-native';
import PropTypes from 'prop-types';

class ProfileListScreen extends PureComponent {
  static propTypes = {
    navigation: PropTypes.shape({
      navigate: PropTypes.func.isRequired,
    }).isRequired,
  }

  static navigationOptions = {
    title: 'Friends',
  };

  state = {
    friendsList: [],
  }

  componentWillMount() {
    fetch('https://randomuser.me/api/?results=25', {
      method: 'GET',
    })
      .then(resp => resp.json())
      .then(({ results }) => {
        this.setState({ friendsList: results });
      })
      .catch(error => console.error('Error:', error));
  }

  render() {
    const {
      navigation: {
        navigate,
      },
    } = this.props;
    const { friendsList } = this.state;

    return (
      <View>
        <StatusBar backgroundColor="#bf7200" barStyle="dark-content" />
        <FlatList
          data={friendsList}
          keyExtractor={item => item.email}
          renderItem={({ item: friend }) => (
            <TouchableOpacity
              onPress={() => navigate('Profile', { ...friend })}
            >
              <View
                style={{
                  flexDirection: 'row',
                  alignItems: 'center',
                  borderBottomColor: '#ffe0b2',
                  borderBottomWidth: 4,
                  paddingHorizontal: 5,
                }}
              >
                <Image
                  style={{
                    width: 100,
                    height: 100,
                    borderRadius: 50,
                  }}
                  source={{
                    uri: friend.picture.medium,
                  }}
                />
                <Text
                  style={{
                    textTransform: 'capitalize',
                    fontSize: 20,
                    color: '#ff9800',
                    paddingLeft: 25,
                  }}
                >
                  {`${friend.name.first} ${friend.name.last}`}
                </Text>
              </View>
            </TouchableOpacity>
          )}
        />
      </View>
    );
  }
}

export default ProfileListScreen;
