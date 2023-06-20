/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import worker from '@ohos.worker';
import { adjustImageValue } from '../common/utils/adjustUtil';
import Logger from '../common/utils/logger';

let workerPort = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessage = function (event) {
  let bufferArray = event.data.buffer;
  let lastValue = event.data.lastValue;
  let currentValue = event.data.currentValue;
  let buffer = adjustImageValue(bufferArray, lastValue, currentValue);
  workerPort.postMessage(buffer);
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = function (event) {
  Logger.error('AdjustBrightnessWork', 'Failed to load the content. Cause: %{public}s',
    `on message error ${JSON.stringify(event)}`);
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param error error message
 */
workerPort.onerror = function (error) {
  Logger.error('AdjustBrightnessWork', 'Failed to load the content. Cause: %{public}s',
    `on worker error ${JSON.stringify(error)}`);
}