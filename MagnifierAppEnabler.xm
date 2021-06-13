/* Magnifier App Enabler
 * Copyright (C) 2020 Tomasz Poliszuk
 *
 * Magnifier App Enabler is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * Magnifier App Enabler is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Magnifier App Enabler. If not, see <https://www.gnu.org/licenses/>.
 */


@interface SBIcon : NSObject
@end
@interface SBLeafIcon : SBIcon
@property (nonatomic,copy,readonly) NSString * applicationBundleID;
@end
@interface SBApplicationIcon : SBLeafIcon
@end

%hook SBIconModel
- (bool)isIconVisible:(SBApplicationIcon *)icon {
	bool origValue = %orig;
	if ( [icon.applicationBundleID isEqualToString:@"com.apple.Magnifier"] ) {
		return YES;
	}
	return origValue;
}
%end
