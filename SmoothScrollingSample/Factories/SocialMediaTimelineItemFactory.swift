//
//  SocialMediaTimelineItemFactory.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/18/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

final class SocialMediaTimelineItemFactory {
	
	static let shared = SocialMediaTimelineItemFactory()
	
	private var items = [SocialMediaTimelineItem]()
	
	func getTimelineItems() -> [SocialMediaTimelineItem] {
		
		if items.isEmpty {
			generateItems()
		}
		
		return items
	}
	
	private func generateItems() {
		
		// TODO: Pass avatar URLs later.
		
		let users: [SocialMediaUser] = [
			SocialMediaUser(
				name: "Nick Fury",
				avatarURL: URL(string: "https://68.media.tumblr.com/avatar_af2fd2579390_128.png")
			),
			SocialMediaUser(
				name: "Iron Man",
				avatarURL: URL(string: "https://cdn4.iconfinder.com/data/icons/superheroes/512/ironman-128.png")
			),
			SocialMediaUser(
				name: "Captain America",
				avatarURL: URL(string: "https://68.media.tumblr.com/avatar_f315e8aa100c_128.png")
			),
			SocialMediaUser(
				name: "Thor Odinson",
				avatarURL: URL(string: "https://68.media.tumblr.com/avatar_63e6969c7be6_128.png")
			),
			SocialMediaUser(
				name: "Hulk",
				avatarURL: URL(string: "http://www.stickees.com/files/avatars/comics-characters/1736-hulk-happy.png")
			),
			SocialMediaUser(
				name: "Black Widow",
				avatarURL: URL(string: "https://68.media.tumblr.com/avatar_a54cf132f9a2_128.png")
			),
			SocialMediaUser(
				name: "Hawkeye",
				avatarURL: URL(string: "https://68.media.tumblr.com/avatar_7b43e7170bc6_128.png")
			)
		]
		
		
		let texts: [String] = [

			"There was an idea... to bring together a group of remarkable people. To make them work together when we needed them to, to fight the battles that... we never could. Phil Coulson died still believing in that idea. In heroes.",
			
			"The Avengers. It's what we call ourselves, sort of like a team. 'Earth's Mightiest Heroes' type of thing.",
			
			"I understod that reference.",
			
			"Have care of how you speak. Loki is beyond reason but he is of Asgard. And he is my brother.\n\n\n\n\n...He's adopted.",
			
			"That's my secret Cap, I'm always angry.",
			
			"This is just like Budapest, huh?",
			
			"You and I remember Budapest very differently."
		]
		
		let timelineItems = users.enumerated().map { (index: Int, user: SocialMediaUser) -> SocialMediaTimelineItem in
			
			// TODO: Add image URLs later.
			return SocialMediaTimelineItem(
				user: user,
				text: texts[index],
				imageURL: nil
			)
		}
		
		let repeatedTimelineItems: [[SocialMediaTimelineItem]] = Array(repeating: timelineItems, count: 100)
		
		self.items = repeatedTimelineItems.flatMap { $0 }
	}
	
}
