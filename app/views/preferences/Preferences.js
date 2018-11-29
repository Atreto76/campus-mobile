import React, { Component } from 'react'
import { View, ScrollView } from 'react-native'
import UserAccount from './user/UserAccount'
import CardPreferences from './card/CardPreferences'
import PreferencesItem from './PreferencesItem'
import AppSettings from '../../AppSettings'
import css from '../../styles/css'

// View for user to manage preferences, including which cards are visible
class PreferencesView extends Component {
	static navigationOptions = { title: 'User Profile' }

	constructor(props) {
		super(props)
		this.state = { scrollEnabled: true }
	}

	toggleScroll = () => {
		this.setState({ scrollEnabled: !this.state.scrollEnabled })
	}

	render() {
		return (
			<ScrollView scrollEnabled={this.state.scrollEnabled}>
				<View style={css.profile_inner}>
					<UserAccount />
					<CardPreferences toggleScroll={this.toggleScroll} />
					<PreferencesItem title="Notifications" iconPack="FontAwesome" icon="bell-o" linkType="internal" link="Notifications" />
					<PreferencesItem title="Parking" iconPack="FontAwesome" icon="bell-o" linkType="internal" link="ParkingNotifications" />
					<PreferencesItem title="Feedback" iconPack="Entypo" icon="new-message" linkType="internal" link="Feedback" />
					<PreferencesItem title="Privacy Policy" iconPack="Feather" icon="lock" linkType="external" link={AppSettings.PRIVACY_POLICY_URL} />
				</View>
			</ScrollView>
		)
	}
}

export default PreferencesView
