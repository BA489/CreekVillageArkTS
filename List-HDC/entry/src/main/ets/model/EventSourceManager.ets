/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BroadCast } from '../common/utils/BroadCast';

const APP_KEY_GROUP_DATA_SOURCE_MANAGER = 'app_key_group_data_source_manager'

export class EventSourceManager {
  private broadCast: BroadCast;

  constructor() {
    this.broadCast = new BroadCast();
  }

  public static getInstance(): EventSourceManager {
    let eventSourceManager: EventSourceManager | undefined = AppStorage.Get(APP_KEY_GROUP_DATA_SOURCE_MANAGER);
    if (eventSourceManager === undefined) {
      eventSourceManager = new EventSourceManager();
      AppStorage.SetOrCreate(APP_KEY_GROUP_DATA_SOURCE_MANAGER, eventSourceManager);
    }
    return eventSourceManager;
  }

  public getBroadCast(): BroadCast {
    return this.broadCast;
  }
}