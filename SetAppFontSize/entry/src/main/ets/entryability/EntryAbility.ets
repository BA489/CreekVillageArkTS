/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Ability from '@ohos.application.Ability';
import CommonConstants from '../common/constants/CommonConstants';
import Logger from '../common/utils/Logger';
import PreferencesUtil from '../common/database/Preferencesutil';

const TAG = '[entryAbility]';

/**
 * Lift cycle management of Ability.
 */
export default class EntryAbility extends Ability {
  onCreate(want, launchParam) {
    Logger.info(TAG, 'onCreate');
    globalThis.abilityWant = want;

    PreferencesUtil.createFontPreferences(this.context);
    // 设置字体默认大小
    PreferencesUtil.saveDefaultFontSize(CommonConstants.SET_SIZE_NORMAL);
  }

  onDestroy() {
    Logger.info(TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    Logger.info(TAG, 'onWindowStageCreate');

    windowStage.loadContent('pages/HomePage', (err, data) => {
      if (err.code) {
        Logger.error(TAG, 'Failed to load the content. Cause:' + JSON.stringify(err));
        return;
      }
      Logger.info(TAG, 'Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    Logger.info(TAG, 'onForeground');
  }

  onBackground() {
    // Ability has back to background
    Logger.info(TAG, 'onBackground');
  }
};