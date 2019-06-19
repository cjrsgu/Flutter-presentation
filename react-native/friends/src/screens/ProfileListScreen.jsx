import React, { PureComponent } from 'react';
import {
  View,
  Text,
  Image,
  FlatList,
  TouchableOpacity,
} from 'react-native';

class ProfileListScreen extends PureComponent {
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
        <Text>ProfileListScreen</Text>
        <FlatList
          data={friendsList}
          keyExtractor={item => item.email}
          renderItem={({ item: friend }) => (
            <TouchableOpacity
              onPress={() => navigate('Profile', { ...friend })}
            >
              <View
                style={{
                  height: 100,
                }}
              >
                <Image
                  style={{
                    width: 50,
                    height: 50,
                  }}
                  source={{
                    uri: friend.picture.thumbnail,
                  }}
                />
                <Text>{friend.name.first}</Text>
                <Text>{friend.name.last}</Text>
              </View>
            </TouchableOpacity>
          )}
        />
      </View>
    );
  }
}

export default ProfileListScreen;
