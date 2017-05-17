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
			SocialMediaUser(name: "Nick Fury", avatarURL: nil),
			SocialMediaUser(name: "Iron Man", avatarURL: nil),
			SocialMediaUser(name: "Captain America", avatarURL: nil),
			SocialMediaUser(name: "Thor Odinson", avatarURL: nil),
			SocialMediaUser(name: "Hulk", avatarURL: nil),
			SocialMediaUser(name: "Black Widow", avatarURL: nil),
			SocialMediaUser(name: "Hawkeye", avatarURL: nil)
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
		
		items = users.enumerated().map { (index: Int, user: SocialMediaUser) -> SocialMediaTimelineItem in
			
			// TODO: Add image URLs later.
			return SocialMediaTimelineItem(
				user: user,
				text: texts[index],
				imageURL: nil
			)
		}
	}
	
}
