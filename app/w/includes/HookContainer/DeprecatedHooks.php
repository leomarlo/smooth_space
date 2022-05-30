<?php
/**
 * Holds list of deprecated hooks and methods for retrieval
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 * http://www.gnu.org/copyleft/gpl.html
 *
 * @file
 */

namespace MediaWiki\HookContainer;

use InvalidArgumentException;

class DeprecatedHooks {

	/**
	 * @var array[] List of deprecated hooks. Value arrays for each hook contain:
	 *  - deprecatedVersion: (string) Version in which the hook was deprecated,
	 *    to pass to wfDeprecated().
	 *  - component: (string, optional) $component to pass to wfDeprecated().
	 *  - silent (bool, optional) If true, no deprecation warning will be raised
	 */
	private $deprecatedHooks = [
		'AddNewAccount' => [ 'deprecatedVersion' => '1.27', 'silent' => true ],
		'ArticleUndeleteLogEntry' => [ 'deprecatedVersion' => '1.37' ],
		'BaseTemplateAfterPortlet' => [ 'deprecatedVersion' => '1.35' ],
		'BeforeParserFetchTemplateAndtitle' => [ 'deprecatedVersion' => '1.36' ],
		'BeforeParserrenderImageGallery' => [ 'deprecatedVersion' => '1.35' ],
		'BeforeResetNotificationTimestamp' => [ 'deprecatedVersion' => '1.37' ],
		'EditPageBeforeEditToolbar' => [ 'deprecatedVersion' => '1.36' ],
		'InternalParseBeforeSanitize' => [ 'deprecatedVersion' => '1.35' ],
		'LocalFile::getHistory' => [ 'deprecatedVersion' => '1.37' ],
		'MagicWordwgVariableIDs' => [ 'deprecatedVersion' => '1.35', 'silent' => true ],
		'PageContentSave' => [ 'deprecatedVersion' => '1.35', 'silent' => true ],
		'ParserGetVariableValueVarCache' => [ 'deprecatedVersion' => '1.35' ],
		'ParserSectionCreate' => [ 'deprecatedVersion' => '1.35' ],
		'ParserTestTables' => [ 'deprecatedVersion' => '1.36', 'silent' => true ],
		'PrefixSearchBackend' => [ 'deprecatedVersion' => '1.27', 'silent' => true ],
		'ProtectionForm::buildForm' => [ 'deprecatedVersion' => '1.36', 'silent' => true ],
		'ResourceLoaderTestModules' => [ 'deprecatedVersion' => '1.33' ],
		'RollbackComplete' => [ 'deprecatedVersion' => '1.36', 'silent' => true ],
		'SkinGetPoweredBy' => [ 'deprecatedVersion' => '1.37' ],
		'SpecialMuteSubmit' => [ 'deprecatedVersion' => '1.35', 'silent' => true ],
		'UserLoadFromDatabase' => [ 'deprecatedVersion' => '1.37' ],
		'UserLoadOptions' => [ 'deprecatedVersion' => '1.37' ],
		'UserResetAllOptions' => [ 'deprecatedVersion' => '1.37' ],
		'UserSaveOptions' => [ 'deprecatedVersion' => '1.37' ],
		'UserSetCookies' => [ 'deprecatedVersion' => '1.27' ],
		'WikiPageDeletionUpdates' => [ 'deprecatedVersion' => '1.32', 'silent' => true ],
		'UndeleteForm::undelete' => [ 'deprecatedVersion' => '1.37' ],
		'userCan' => [ 'deprecatedVersion' => '1.37' ],
		'ArticleDelete' => [ 'deprecatedVersion' => '1.37', 'silent' => true ],
		'ArticleDeleteComplete' => [ 'deprecatedVersion' => '1.37', 'silent' => true ],
	];

	/**
	 * @param array[] $deprecatedHooks List of hooks to mark as deprecated.
	 * Value arrays for each hook contain:
	 *  - deprecatedVersion: (string) Version in which the hook was deprecated,
	 *    to pass to wfDeprecated().
	 *  - component: (string, optional) $component to pass to wfDeprecated().
	 *  - silent: (bool, optional) True to not raise any deprecation warning
	 */
	public function __construct( array $deprecatedHooks = [] ) {
		foreach ( $deprecatedHooks as $hook => $info ) {
			$this->markDeprecated(
				$hook,
				$info['deprecatedVersion'],
				$info['component'] ?? false,
				$info['silent'] ?? false
			);
		}
	}

	/**
	 * For use by extensions, to add to list of deprecated hooks.
	 * Core-defined hooks should instead be added to $this->$deprecatedHooks directly.
	 * However, the preferred method of marking a hook deprecated is by adding it to
	 * the DeprecatedHooks attribute in extension.json
	 *
	 * @param string $hook
	 * @param string $version Version in which the hook was deprecated, to pass to wfDeprecated()
	 * @param string|null $component (optional) component to pass to wfDeprecated().
	 * @param bool $silent True to not raise any deprecation warning
	 * @throws InvalidArgumentException Hook has already been marked deprecated
	 */
	public function markDeprecated( string $hook, string $version,
		?string $component = null, bool $silent = false
	): void {
		if ( isset( $this->deprecatedHooks[$hook] ) ) {
			throw new InvalidArgumentException(
				"Cannot mark hook '$hook' deprecated with version $version. " .
				"It is already marked deprecated with version " .
				$this->deprecatedHooks[$hook]['deprecatedVersion']
			);
		}
		$hookInfo = [
			'deprecatedVersion' => $version,
			'silent' => $silent
		];
		if ( $component ) {
			$hookInfo['component'] = $component;
		}
		$this->deprecatedHooks[$hook] = $hookInfo;
	}

	/**
	 * Checks whether hook is marked deprecated
	 * @param string $hook Hook name
	 * @return bool
	 */
	public function isHookDeprecated( string $hook ): bool {
		return isset( $this->deprecatedHooks[$hook] );
	}

	/**
	 * Gets deprecation info for a specific hook or all hooks if hook not specified
	 * @param string|null $hook (optional) Hook name
	 * @return array|null Value array from $this->deprecatedHooks for a specific hook or all hooks
	 */
	public function getDeprecationInfo( ?string $hook = null ): ?array {
		if ( !$hook ) {
			return $this->deprecatedHooks;
		}
		return $this->deprecatedHooks[$hook] ?? null;
	}
}